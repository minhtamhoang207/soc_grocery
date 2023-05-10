import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/app/util/util.dart';
import 'package:soc_grocery/data/models/response/payment_history.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';
import '../controllers/account_controller.dart';

class AccountView extends GetView<AccountController> {
  const AccountView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const Gap(80),
        Obx(() => Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(13),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Gap(15),
                  const AppImage(
                    url: 'https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg',
                    height: 100,
                    width: 100,
                    boxShape: BoxShape.circle,
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          controller.user.value?.user?.username ?? '',
                          style: AppTextStyles.montserrat(
                              fontSize: 16, fonWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(15),
                      Center(
                        child: Text(
                          controller.user.value?.user?.email ?? '',
                          style: AppTextStyles.montserrat(
                              fontSize: 13, fonWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                  const Gap(20)
                ],
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 15),
            child: Row(
              children: [
                Text(
                  'Lịch sử giao dịch',
                  style: AppTextStyles.montserrat(fontSize: 18),
                ),
                const Spacer(),
                Text(
                  'Xem tất cả',
                  style: AppTextStyles.montserrat(
                      fontSize: 15, color: AppColors.primary),
                ),
              ],
            )),
        Expanded(
          child: Obx(() =>
              RefreshIndicator(
                onRefresh: () async {
                  controller.getPaymentHistory();
                },
                child: ListView.separated(
                  shrinkWrap: true,
                    padding: const EdgeInsets.only(bottom: 50, left: 10, right: 10),
                    itemBuilder: (context, index) {
                      PaymentHistory history = controller.history.value[
                        controller.history.value.length - index - 1
                      ];
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                      CupertinoIcons.money_dollar_circle_fill,
                                      color: Colors.redAccent),
                                  const Gap(15),
                                  Text(
                                    '- ${Utils.formatCurrency(history.total)}',
                                    style: const TextStyle(
                                        fontSize: 18,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              ),
                              const Gap(10),
                              Row(
                                children: [
                                  Icon(
                                      CupertinoIcons.calendar,
                                      color: AppColors.primary),
                                  const Gap(13),
                                  Text(
                                    '${history.createdAt}',
                                    style: const TextStyle(
                                        fontSize: 13
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ),
                      );
                    },
                    separatorBuilder: (_, __) => const Divider(),
                    itemCount: controller.history.value.length
                ),
              ))
        ),
        GestureDetector(
          onTap: () async {
            await controller.localStorageService.clearAll();
            GoogleSignIn().signOut();
            Get.offAllNamed(Routes.LOGIN);
          },
          child: Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
              padding: const EdgeInsets.only(top: 13, bottom: 13),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Đăng xuất',
                    style: AppTextStyles.montserrat(
                        fontSize: 16,
                        fonWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  const Gap(15),
                  const Icon(Icons.logout, color: Colors.white)
                ],
              )),
        )
      ],
    ));
  }
}
