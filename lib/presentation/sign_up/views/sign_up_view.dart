import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:gap/gap.dart';

import '../../../app/routes/app_pages.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ever(controller.signUpStatus, (callback) {
      if (callback.isLoading) {
        BotToast.showLoading();
      } else if (callback.isSuccess) {
        BotToast.closeAllLoading();
        Get.offAllNamed(Routes.DASHBOARD);
      } else if (callback.isError) {
        BotToast.showText(text: controller.signUpStatus.value.errorMessage ?? '');
        BotToast.closeAllLoading();
      }
    });

    return Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 50),
          children: [
            const Gap(50),
            SvgPicture.asset(Assets.icons.icCarrot),
            const Gap(60),
            Text(
              "Đăng ký",
              style: AppTextStyles.montserrat(
                  fontSize: 26, fonWeight: FontWeight.w600),
            ),
            const Gap(30),
            Text(
              "Tên đăng nhập",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            TextField(
              controller: controller.username,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary, width: 2))),
            ),
            const Gap(30),
            Text(
              "Email",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            TextField(
              controller: controller.email,
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary, width: 2))),
            ),
            const Gap(30),
            Text(
              "Mật khấu",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            Obx(() =>
                TextField(
                  obscureText: !controller.showPassword.value,
                  controller: controller.password,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                            controller.showPassword.value
                                ? CupertinoIcons.eye_slash
                                : Icons.remove_red_eye_outlined,
                            color: AppColors.primary),
                        onPressed: () {
                          controller.showPassword.toggle();
                        },
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primary, width: 2))),
                )
            ),

            const Gap(30),
            Text(
              "Xác nhận mật khẩu",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            Obx(() =>
                TextField(
                  controller: controller.confirmPassword,
                  obscureText: !controller.showConfirmPassword.value,
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                            controller.showConfirmPassword.value
                                ? CupertinoIcons.eye_slash
                                : Icons.remove_red_eye_outlined,
                            color: AppColors.primary),
                        onPressed: () {
                          controller.showConfirmPassword.toggle();
                        },
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primary, width: 2))),
                )
            ),

            const Gap(45),
            GestureDetector(
              onTap: () {
                controller.signUp();
              },
              child: Container(
                decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(5)),
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Center(
                  child: Text(
                    'Đăng ký',
                    style: AppTextStyles.montserrat(
                        fontSize: 18,
                        fonWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            const Gap(50),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: 'Đã có tài khoản? ',
                style: AppTextStyles.montserrat(fontSize: 14),
                children: [
                  TextSpan(
                      text: 'Đăng nhập',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => Get.back(),
                      style: AppTextStyles.montserrat(
                          color: AppColors.primary, fontSize: 14))
                ],
              ),
            ),
            const Gap(50)
          ],
        ));
  }
}
