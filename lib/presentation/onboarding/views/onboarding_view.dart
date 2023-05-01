import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';

import '../controllers/onboarding_controller.dart';

class OnBoardingView extends GetView<OnboardingController> {
  const OnBoardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
          child: SvgPicture.asset(Assets.icons.icCarrot)
      )
    );
  }
}
