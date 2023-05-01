import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:gap/gap.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              "Tên người dùng",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            TextField(
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
              decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary, width: 2))),
            ),
            const Gap(30),
            Text(
              "Password",
              style: AppTextStyles.montserrat(
                  fontSize: 16,
                  fonWeight: FontWeight.w600,
                  color: AppColors.textGray),
            ),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined,
                        color: AppColors.primary),
                    onPressed: () {},
                  ),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.primary, width: 2))),
            ),
            const Gap(45),
            Container(
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
            )
          ],
        ));
  }
}
