import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:momo_vn/momo_vn.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:soc_grocery/app/util/util.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../controllers/payment_controller.dart';

class PaymentView extends GetView<PaymentController> {
  const PaymentView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          'Chọn phương thức thanh toán',
          style: AppTextStyles.montserrat(
              color: Colors.black,
              fontSize: 18
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(() => controller.status.value.isSuccess
          ? MyApp(controller: controller)
          : const Center(child: CircularProgressIndicator()))
    );
  }
}


class MyApp extends StatefulWidget {
  final PaymentController controller;
  const MyApp({super.key, required this.controller});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late final PaymentController controller;
  late MomoVn _momoPay;
  late PaymentResponse _momoPaymentResult;

  // ignore: non_constant_identifier_names
  late String _paymentStatus;

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
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
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, bottom: 20, right: Get.width / 2),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Colors.pinkAccent.withOpacity(0.3),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.pinkAccent.withOpacity(0.8))
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(Assets.icons.icMomo.path, height: 30, width: 30),
              const Gap(10),
              const Text(
                  'Ví momo'
              )
            ],
          ),
        ),
        const Text(
            'Chi tiết giao dịch',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            children: [
              Row(
                children: const [
                  Text('Dịch vụ',
                    style: TextStyle(
                        color: Colors.grey
                    ),),
                  Expanded(
                    child: Text('Thanh toán Shopeyyy',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  const Text('Số tiền',
                    style: TextStyle(
                        color: Colors.grey
                    ),),
                  Expanded(
                    child: Text(
                      Utils.formatCurrency(controller.total ?? 0),
                      textAlign: TextAlign.end,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              ),
              const Gap(30),
              const Divider(),
              const Gap(30),
              Row(
                children: const [
                  Text('Phí giao dịch',
                    style: TextStyle(
                        color: Colors.grey
                    ),),
                  Expanded(
                    child: Text('Miễn phí',
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                  )
                ],
              ),
            ],
          ),
        ),
        const Gap(50),
        GestureDetector(
          onTap: () {
            MomoPaymentInfo options = MomoPaymentInfo(
                merchantName: controller.user?.user?.username ?? '',
                merchantCode: 'MOMOTTNO20220527',
                partnerCode: 'MOMOTTNO20220527',
                appScheme: "momottno20220527",
                amount: controller.total ?? 0,
                orderId: controller.transactionID,
                orderLabel: 'Thanh toán đơn hàng Shopeyyy',
                merchantNameLabel: "Shopeyyy",
                fee: 0,
                description: 'Thanh toán đơn hàng Shopeyyy',
                isTestMode: true,
                partner: 'Shoppeyyy'
            );
            try {
              _momoPay.open(options);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
          child: Container(
            margin: const EdgeInsets.only(left: 5, right: 5, bottom: 30),
            padding: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.primary
            ),
            child: Center(
              child: Text(
                'Thanh toán ngay',
                style: AppTextStyles.montserrat(
                    fontSize: 18,
                    fonWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
        )
      ],
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
    log(response.token ?? 'token null');
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
