import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';

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
            controller.changeTab(index: index);
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