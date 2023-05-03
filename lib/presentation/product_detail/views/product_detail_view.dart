import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/util/util.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  const ProductDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: EdgeInsets.zero,
      children: [
        Stack(
          children: [
            Hero(
              tag: controller.product.id!,
              child: CachedNetworkImage(
                imageUrl:
                    "https://live-production.wcms.abc-cdn.net.au/b983edcea41673904b177071b138dadb?impolicy=wcms_crop_resize&cropH=861&cropW=1529&xPos=0&yPos=345&width=862&height=485",
                imageBuilder: (context, imageProvider) => Container(
                  height: Get.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.6),
                        spreadRadius: 3,
                        blurRadius: 3,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                  color: AppColors.primary,
                )),
                errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error)),
              ),
            ),
            Positioned(
              top: 50,
              child: Row(
                children: [
                  const Gap(10),
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, right: 10, left: 8),
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          shape: BoxShape.circle),
                      child: const Icon(Icons.arrow_back_ios_new_outlined,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(20),
        Row(
          children: [
            const Gap(20),
            Expanded(
              child: Text(
                controller.product.name ?? '',
                style: AppTextStyles.montserrat(
                    fontSize: 20, fonWeight: FontWeight.bold),
              ),
            ),
            const Gap(20),
            IconButton(
                onPressed: () {}, icon: const Icon(Icons.favorite_border))
          ],
        ),
        const Gap(20),
        Row(
          children: [
            const Gap(5),
            IconButton(
                onPressed: () {
                  controller.decrease();
                },
                icon: const Icon(CupertinoIcons.minus)),
            Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border:
                        Border.all(color: AppColors.textGray.withOpacity(0.8))),
                child: Obx(() => Text(
                      controller.productCount.value.toString(),
                      style: AppTextStyles.montserrat(
                          fonWeight: FontWeight.bold, fontSize: 16),
                    ))),
            IconButton(
                onPressed: () {
                  controller.increase();
                },
                icon: Icon(CupertinoIcons.add, color: AppColors.primary)),
            Expanded(
                child: Obx(
              () => Text(
                Utils.formatCurrency(controller.productPrice.value),
                textAlign: TextAlign.end,
                style: AppTextStyles.montserrat(
                    fontSize: 18, fonWeight: FontWeight.bold),
              ),
            )),
            const Gap(20)
          ],
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            'Mô tả',
            style: AppTextStyles.montserrat(
              fonWeight: FontWeight.bold,
              fontSize: 16
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            controller.product.description ?? '',
            style: AppTextStyles.montserrat(
                fonWeight: FontWeight.w400,
                fontSize: 15
            ),
          ),
        ),
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Đánh giá',
                  style: AppTextStyles.montserrat(
                      fonWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                ),
              ),
              const Gap(20),
              AbsorbPointer(
                absorbing: true,
                child: RatingBar.builder(
                  itemSize: 25,
                  initialRating: double.parse((controller.product.rating ?? 0).toString()),
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      const Icon(
                        Icons.star,
                        size: 8,
                        color: Colors.amber,
                      ), onRatingUpdate: (double value) {  },
                ),
              )
            ],
          )
        ),
      ],
    ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(12)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Thêm vào giỏ hàng',
              style: AppTextStyles.montserrat(
                color: Colors.white,
                fonWeight: FontWeight.w600,
                fontSize: 14
              ),
            ),
            const Gap(15),
            const Icon(CupertinoIcons.cart_badge_plus, color: Colors.white)
          ],
        )
      ),
    );
  }
}
