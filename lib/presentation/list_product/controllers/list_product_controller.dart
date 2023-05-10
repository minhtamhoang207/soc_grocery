import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_speech/config/recognition_config.dart';
import 'package:google_speech/config/recognition_config_v1.dart';
import 'package:google_speech/config/streaming_recognition_config.dart';
import 'package:google_speech/speech_client_authenticator.dart';
import 'package:google_speech/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:soc_grocery/presentation/explore/views/explore_view.dart';

import '../../../app/core/exceptions/exceptions.dart';
import '../../../data/models/request/add_item_request.dart';
import '../../../data/models/response/product_response.dart';
import '../../../domain/usecases/cart/cart_usecase.dart';
import '../../../domain/usecases/product/get_product_usecase.dart';

class ListProductController extends GetxController {
  ListProductController(this._getProductUseCase, this._cartUseCases);

  final CartUseCases _cartUseCases;

  final GetProductUseCase _getProductUseCase;
  Rx<List<ProductResponse>> listProduct = Rx([]);
  Rx<List<ProductResponse>> listProductCopy = Rx([]);

  final status = RxStatus.empty().obs;
  final toastStatus = RxStatus.empty().obs;
  final CategoryArgument? category = Get.arguments;

  final searchController = TextEditingController().obs;
  RxBool recognizing = RxBool(false);
  RxBool recognizeFinished = RxBool(false);
  RxString text = RxString('');

  @override
  void onInit() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    getListProduct();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void searchCategory({required String keyword}) async {
    if (keyword.isNotEmpty) {
      List<ProductResponse> listSearch = [];
      for (ProductResponse e in listProduct.value) {
        if ((e.name ?? '').toLowerCase().contains(keyword.toLowerCase())) {
          listSearch.add(e);
        }
      }
      listProduct.value = listSearch;
    } else {
      listProduct.value = listProductCopy.value;
    }
  }

  Future<void> getListProduct() async {
    try {
      status.value = RxStatus.loading();
      listProduct.value = await _getProductUseCase.execute(category?.id);
      listProductCopy.value = listProduct.value;
      status.value = RxStatus.success();
    } catch (e){
      log(e.toString());
      status.value = RxStatus.error('Đã xẩy ra lỗi');
    }
  }

  Future<void> addItem({required String productID}) async {
    try {
      toastStatus.value = RxStatus.loading();
      await _cartUseCases.addItem(
          productID: productID,
          addItemRequest: AddItemRequest(
              quantity: 1,
              productID: productID
          )
      );
      toastStatus.value = RxStatus.success();
    } on ErrorEntity catch (e) {
      log(e.message);
      toastStatus.value = RxStatus.error(e.message);
    } on Exception catch (e) {
      log(e.toString());
      toastStatus.value = RxStatus.error('Đã xảy ra lỗi');
    }
  }

  final _audioRecorder = Record();

  Future<void> start() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        recognizing.value = true;
        await _audioRecorder.start(
            encoder: AudioEncoder.wav, samplingRate: 16000, numChannels: 1);
      }
    } catch (e) {
      recognizing.value = false;
      log(e.toString());
    }
  }

  Future<void> stop() async {
    recognizing.value = false;
    final path = await _audioRecorder.stop();
    if (path != null) {
      streamingRecognize(path);
    }
  }

  void recognize(String path) async {
    recognizing.value = true;
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/speech_to_text.json')));
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();
    final audio = await _getAudioContent(path);

    await speechToText.recognize(config, audio).then((value) {
      text.value =
          value.results.map((e) => e.alternatives.first.transcript).join('\n');
    }).whenComplete(
            () => {recognizeFinished.value = true, recognizing.value = false});
  }

  void streamingRecognize(String path) async {
    final serviceAccount = ServiceAccount.fromString(
        (await rootBundle.loadString('assets/speech_to_text.json')));
    final speechToText = SpeechToText.viaServiceAccount(serviceAccount);
    final config = _getConfig();

    final responseStream = speechToText.streamingRecognize(
        StreamingRecognitionConfig(config: config, interimResults: true),
        await _getAudioStream(path));

    responseStream.listen((data) {
      text.value =
          data.results.map((e) => e.alternatives.first.transcript).join('\n');
      searchController.value.text =
          text.value.replaceAll('.', '').toLowerCase();
    }, onDone: () {
      searchCategory(keyword: text.value.replaceAll('.', '').toLowerCase());
    });
  }

  Future<List<int>> _getAudioContent(String path) async {
    return File(path).readAsBytesSync().toList();
  }

  Future<Stream<List<int>>> _getAudioStream(String path) async {
    return File(path).openRead();
  }

  RecognitionConfig _getConfig() =>
      RecognitionConfig(
          encoding: AudioEncoding.LINEAR16,
          model: RecognitionModel.basic,
          enableAutomaticPunctuation: true,
          sampleRateHertz: 16000,
          languageCode: 'vi-VN');
}
