import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:soc_grocery/presentation/account/controllers/account_controller.dart';
import 'package:soc_grocery/presentation/cart/bindings/cart_binding.dart';
import 'package:soc_grocery/presentation/cart/controllers/cart_controller.dart';
import 'package:soc_grocery/presentation/explore/controllers/explore_controller.dart';
import 'package:soc_grocery/presentation/favourite/controllers/favourite_controller.dart';
import 'package:soc_grocery/presentation/shop/controllers/shop_controller.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.listTab[controller.currentTab.value],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          selectedItemColor: AppColors.primary,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          unselectedFontSize: 12,
          unselectedItemColor: AppColors.black,
          unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
          onTap: (index) {
            switch (index) {
              case 0:
                Get.put(ShopController(Get.find(), Get.find()));
                break;
              case 1:
                Get.put(ExploreController(Get.find()));
                break;
              case 2:
                CartBinding().dependencies();
                break;
              case 3:
                Get.put(FavouriteController());
                break;
              case 4:
                Get.put(AccountController());
                break;
              default:
                log('index not found');
                break;
            }
            if (index != 3) {
              controller.changeTab(index: index);
            } else {
              BotToast.showText(text: 'Coming real soon ^^');
              // FirebaseCrashlytics.instance.crash();
            }
          },
          currentIndex: controller.currentTab.value,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icShop,
                color: AppColors.black,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icShop,
                color: AppColors.primary,
              ),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icExplore,
                color: AppColors.black,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icExplore,
                color: AppColors.primary,
              ),
              label: 'Khám phá',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icCart,
                color: AppColors.black,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icCart,
                color: AppColors.primary,
              ),
              label: 'Giỏ hàng',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icHeart,
                color: AppColors.black,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icHeart,
                color: AppColors.primary,
              ),
              label: 'Yêu thích',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                Assets.icons.icPerson,
                color: AppColors.black,
              ),
              activeIcon: SvgPicture.asset(
                Assets.icons.icPerson,
                color: AppColors.primary,
              ),
              label: 'Tài khoản',
            ),
          ],
        ),
      );
    });
  }
}
