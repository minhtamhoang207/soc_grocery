import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';
import 'package:soc_grocery/presentation/shop/views/widgets/product_item.dart';

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
              child: Row(
                children: [
                  const AppImage(
                    url: 'https://haycafe.vn/wp-content/uploads/2021/11/Anh-avatar-dep-chat-lam-hinh-dai-dien.jpg',
                    height: 64,
                    width: 64,
                    boxShape: BoxShape.circle,
                  ),
                  const Gap(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.user.value?.user?.username ?? '',
                          style: AppTextStyles.montserrat(
                              fontSize: 16, fonWeight: FontWeight.bold),
                        ),
                        const Gap(5),
                        Text(
                          controller.user.value?.user?.email ?? '',
                          style: AppTextStyles.montserrat(
                              fontSize: 13, fonWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  const Gap(15),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.primary),
                    child: const Icon(Icons.mode_edit_outline_outlined,
                        color: Colors.white),
                  )
                ],
              ),
            )),
        Padding(
            padding:
                const EdgeInsets.only(left: 25, right: 25, top: 30, bottom: 15),
            child: Row(
              children: [
                Text(
                  'Yêu thích',
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
          child: GridView.builder(
            itemCount: 9,
            padding: const EdgeInsets.only(left: 25, right: 15, bottom: 20),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 3 / 3.5,
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 15,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Container();
            },
          ),
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
