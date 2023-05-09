import 'package:bot_toast/bot_toast.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/presentation/shop/views/widgets/banner.dart';
import 'package:soc_grocery/presentation/shop/views/widgets/product_item.dart';

import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ever(controller.status, (callback) {
      if (callback.isLoading) {
        BotToast.showLoading();
      } else if (callback.isSuccess) {
        BotToast.closeAllLoading();
      } else if (callback.isError) {
        BotToast.showText(text: controller.status.value.errorMessage ?? '');
        BotToast.closeAllLoading();
      }
    });

    return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            controller.onInit();
          },
          child: ListView(
      children: [
          const Gap(20),
          SvgPicture.asset(Assets.icons.icCarrot),
          const Gap(15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(Assets.icons.icLocation),
                const Gap(10),
                Obx(() => Expanded(child: Text(controller.currentPosition.value)))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  contentPadding: const EdgeInsets.only(top: 15),
                  suffixIcon: IconButton(
                    onPressed: () {

                    },
                    icon: const Icon(CupertinoIcons.mic),
                  ),
                  fillColor: AppColors.lightGray.withOpacity(0.5),
                  border: InputBorder.none,
                  hintText: 'Tìm kiếm sản phẩm',
                  prefixIcon:
                      const Icon(CupertinoIcons.search, color: Colors.black)),
            ),
          ),
          ShopBanner(imgList: controller.imgList),
          Padding(
              padding: const EdgeInsets.only(left: 25, bottom: 10, right: 25, top: 25),
              child: Row(
                children: [
                  Text(
                    'Excluisve offer',
                    style: AppTextStyles.montserrat(fontSize: 18),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LIST_PRODUCT);
                    },
                    child: Text(
                      'See all',
                      style: AppTextStyles.montserrat(
                          fontSize: 15, color: AppColors.primary),
                    ),
                  ),
                ],
              )),
          Obx(() =>
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: controller.listProduct.value.length,
                  padding: const EdgeInsets.only(left: 25),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductResponse product = controller.listProduct.value[index];
                    return ProductItem(product: product, shopController: controller);
                  },
                ),
              )),
          Padding(
              padding:
                  const EdgeInsets.only(left: 25, bottom: 10, right: 25, top: 30),
              child: Row(
                children: [
                  Text(
                    'Best selling',
                    style: AppTextStyles.montserrat(fontSize: 18),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.LIST_PRODUCT);
                    },
                    child: Text(
                      'See all',
                      style: AppTextStyles.montserrat(
                          fontSize: 15, color: AppColors.primary),
                    ),
                  ),
                ],
              )),
          Obx(() =>
              SizedBox(
                height: 280,
                child: ListView.builder(
                  itemCount: controller.listProduct.value.length,
                  padding: const EdgeInsets.only(left: 25),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    ProductResponse product = controller.listProduct.value[index];
                    return ProductItem(product: product, shopController: controller);
                  },
                ),
              )),
      ],
    ),
        ));
  }
}
