import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/app/util/util.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';
import 'package:soc_grocery/presentation/shop/controllers/shop_controller.dart';

import '../../../../app/config/app_colors.dart';
import '../../../../app/config/app_text_styles.dart';

class ProductItem extends StatelessWidget {
  final ProductResponse product;
  final ShopController shopController;
  const ProductItem({
    Key? key, required this.product,
    required this.shopController
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
      },
      child: Container(
        width: Get.width / 2,
        margin: const EdgeInsets.only(right: 15, bottom: 5, top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
                child: Center(
                    child: AppImage(
                      url: product.imageUrls!.isEmpty
                          ? ''
                          : product.imageUrls?.first ?? '',
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                    )
                )
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                product.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.montserrat(
                    fontSize: 16, fonWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12, right: 15, left: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      Utils.formatCurrency(product.price ?? 0),
                      style: AppTextStyles.montserrat(
                          fontSize: 16,
                          fonWeight: FontWeight.bold,
                          color: AppColors.textGray),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      shopController.addItem(productID: product.id ?? '');
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.primary, shape: BoxShape.circle),
                      padding: const EdgeInsets.all(3),
                      child: const Icon(Icons.add, color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
