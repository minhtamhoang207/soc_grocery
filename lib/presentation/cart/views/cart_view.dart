import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:momo_vn/momo_vn.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CartView'),
          centerTitle: true,
        ),
        body: MyApp());
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;

  // ignore: non_constant_identifier_names
  late String _paymentStatus;

  @override
  void initState() {
    super.initState();
    _momoPay = MomoVn();
    _momoPay.on(MomoVn.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _momoPay.on(MomoVn.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _paymentStatus = "";
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('THANH TOÁN QUA ỨNG DỤNG MOMO'),
        ),
        body: Center(
          child: Column(
            children: <Widget>[
              Column(
                children: [
                  IconButton(
                      onPressed: () async {
                        MomoPaymentInfo options = MomoPaymentInfo(
                            merchantName: "Tom beo tot",
                            merchantCode: 'MOMOTTNO20220527',
                            partnerCode: 'MOMOTTNO20220527',
                            appScheme: "momottno20220527",
                            amount: 600000,
                            orderId: '312312aa12',
                            orderLabel: 'Label để hiển thị Mã giao dịch',
                            merchantNameLabel: "Tiêu đề tên cửa hàng",
                            fee: 0,
                            description: 'Mô tả chi tiết',
                            isTestMode: true,
                            partner: 'Shoppeyyy'
                        );
                        try {
                          _momoPay.open(options);
                        } catch (e) {
                          debugPrint(e.toString());
                        }
                      },
                      icon: Icon(Icons.payment))
                ],
              ),
              Text(_paymentStatus.isEmpty ? "CHƯA THANH TOÁN" : _paymentStatus)
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _momoPay.clear();
  }

  void _setState() {
    _paymentStatus = 'Đã chuyển thanh toán';
    if (_momoPaymentResult.isSuccess == true) {
      _paymentStatus += "\nTình trạng: Thành công.";
      _paymentStatus +=
          "\nSố điện thoại: " + _momoPaymentResult.phoneNumber.toString();
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra!;
      _paymentStatus += "\nToken: " + _momoPaymentResult.token.toString();
      log(_paymentStatus);
    } else {
      _paymentStatus += "\nTình trạng: Thất bại.";
      _paymentStatus += "\nExtra: " + _momoPaymentResult.extra.toString();
      _paymentStatus += "\nMã lỗi: " + _momoPaymentResult.status.toString();
      log(_paymentStatus);
    }
  }

  void _handlePaymentSuccess(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    BotToast.showText(text: "THÀNH CÔNG: " + response.phoneNumber.toString());
  }

  void _handlePaymentError(PaymentResponse response) {
    setState(() {
      _momoPaymentResult = response;
      _setState();
    });
    BotToast.showText(text: "THẤT BẠI: " + response.message.toString());
  }
}
