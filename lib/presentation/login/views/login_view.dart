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
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
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
          "Đăng nhập",
          style: AppTextStyles.montserrat(
              fontSize: 26, fonWeight: FontWeight.w600),
        ),
        const Gap(15),
        Text(
          "Nhập email và mật khẩu",
          style: AppTextStyles.montserrat(
              fontSize: 16,
              fonWeight: FontWeight.w600,
              color: AppColors.textGray),
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
                  borderSide: BorderSide(color: AppColors.primary, width: 2))),
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
                  borderSide: BorderSide(color: AppColors.primary, width: 2))),
        ),
        const Gap(30),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {},
              child: Text(
                "Quên mật khẩu?",
                style: AppTextStyles.montserrat(
                    fontSize: 15, fonWeight: FontWeight.w500),
              )),
        ),
        const Gap(15),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.DASHBOARD);
          },
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(5)),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Center(
              child: Text(
                'Đăng nhập',
                style: AppTextStyles.montserrat(
                    fontSize: 18,
                    fonWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
        const Gap(20),
        SignInButton(Buttons.google,
            text: "Tiếp tục với Google",
            padding: const EdgeInsets.symmetric(vertical: 10),
            elevation: 3,
            clipBehavior: Clip.hardEdge,
            onPressed: () {}),
        const Gap(50),
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            text: 'Chưa có tài khoản? ',
            style: AppTextStyles.montserrat(fontSize: 14),
            children: [
              TextSpan(
                  text: 'Đăng ký ngay',
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => Get.toNamed(Routes.SIGN_UP),
                  style: AppTextStyles.montserrat(
                      color: AppColors.primary, fontSize: 14))
            ],
          ),
        )
      ],
    ));
  }
}
