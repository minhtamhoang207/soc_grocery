import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_speech/config/recognition_config.dart';
import 'package:google_speech/config/recognition_config_v1.dart';
import 'package:google_speech/config/streaming_recognition_config.dart';
import 'package:google_speech/speech_client_authenticator.dart';
import 'package:google_speech/speech_to_text.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import 'package:soc_grocery/domain/usecases/category/get_category_use_case.dart';

import '../../../data/models/response/category_response.dart';

class ExploreController extends GetxController {

  final GetCategoryUseCase _getCategoryUseCase;

  ExploreController(this._getCategoryUseCase);
  Rx<List<CategoryResponse>> listCategory = Rx([]);
  Rx<List<CategoryResponse>> listCategoryCopy = Rx([]);
  final searchController = TextEditingController().obs;
  RxBool recognizing = RxBool(false);
  RxBool recognizeFinished = RxBool(false);
  RxString text = RxString('');

  @override
  void onInit() async {
    await Permission.manageExternalStorage.request();
    await Permission.storage.request();
    listCategory.value = await _getCategoryUseCase.execute();
    listCategoryCopy.value = listCategory.value;
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
    if(keyword.isNotEmpty) {
      List<CategoryResponse> listSearch = [];
      for (CategoryResponse e in listCategory.value) {
        if ((e.name ?? '').toLowerCase().contains(keyword.toLowerCase())) {
          listSearch.add(e);
        }
      }
      listCategory.value = listSearch;
    } else {
      listCategory.value = listCategoryCopy.value;
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
      searchController.value = TextEditingController(text: text.value);
      log(text.value + '------>');
    }, onDone: () {});
  }

  Future<List<int>> _getAudioContent(String path) async {
    return File(path).readAsBytesSync().toList();
  }

  Future<Stream<List<int>>> _getAudioStream(String path) async {
    return File(path).openRead();
  }

  RecognitionConfig _getConfig() => RecognitionConfig(
      encoding: AudioEncoding.LINEAR16,
      model: RecognitionModel.basic,
      enableAutomaticPunctuation: true,
      sampleRateHertz: 16000,
      languageCode: 'en-US');

}
