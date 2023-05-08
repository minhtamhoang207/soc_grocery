import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/presentation/account/views/account_view.dart';
import 'package:soc_grocery/presentation/cart/controllers/cart_controller.dart';
import 'package:soc_grocery/presentation/cart/views/cart_view.dart';
import 'package:soc_grocery/presentation/explore/views/explore_view.dart';
import 'package:soc_grocery/presentation/favourite/views/favourite_view.dart';
import 'package:soc_grocery/presentation/shop/views/shop_view.dart';

class DashboardController extends GetxController {

  Rx<int> currentTab = Rx<int>(0);
  List<Widget> listTab = [
    const ShopView(),
    const ExploreView(),
    const CartView(),
    const FavouriteView(),
    const AccountView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTab({required int index}){
    currentTab.value = index;
  }
}
