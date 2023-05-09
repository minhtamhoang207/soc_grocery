import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/routes/app_pages.dart';
import 'package:soc_grocery/app/util/util.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../controllers/list_product_controller.dart';

class ListProductView extends GetView<ListProductController> {
  const ListProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    ever(controller.toastStatus, (callback) {
      if (callback.isLoading) {
        BotToast.showLoading();
      } else if (callback.isSuccess) {
        BotToast.closeAllLoading();
      } else if (callback.isError) {
        BotToast.showText(text: controller.toastStatus.value.errorMessage ?? '');
        BotToast.closeAllLoading();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text(
          controller.category?.name ?? 'Tất cả sản phẩm',
          style: AppTextStyles.montserrat(
            color: Colors.black,
            fontSize: 18
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.CART);
              },
              icon: const Icon(CupertinoIcons.cart, color: Colors.black)
          )
        ],
      ),
      body: Obx((){
          if(controller.status.value.isLoading){
            return const Center(child: CircularProgressIndicator());
          } else if(controller.status.value.isSuccess) {
            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: const EdgeInsets.all(10),
              itemCount: controller.listProduct.value.length,
              itemBuilder: (context, index) {
                ProductResponse product = controller.listProduct.value[index];
                return InkWell(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_DETAIL, arguments: product);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.category.withOpacity(0.15),
                        border: Border.all(color: AppColors.category)),
                    child: Column(
                      children: [
                        AppImage(
                          height: 150,
                          borderRadius: BorderRadius.circular(8),
                          url: product.imageUrls!.isNotEmpty
                              ? product.imageUrls!.first
                              : '',
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            product.name ?? '',
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.montserrat(
                                fonWeight: FontWeight.w600, fontSize: 15),
                          ),
                        ),
                        const Gap(10),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                          child: Text(
                            product.description ?? '',
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: AppTextStyles.montserrat(
                                fonWeight: FontWeight.w500, fontSize: 11),
                          ),
                        ),
                        Divider(color: AppColors.primary),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  Utils.formatCurrency(product.price ?? 0),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.montserrat(
                                      fonWeight: FontWeight.w700, fontSize: 12),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  controller.addItem(productID: product.id ?? '');
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
              },
            );
          } else {
            return const SizedBox();
          }
        }
      )
    );
  }
}
