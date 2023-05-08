import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/config/app_text_styles.dart';
import '../controllers/list_product_controller.dart';

class ListProductView extends GetView<ListProductController> {
  const ListProductView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.category?.name ?? 'Tất cả sản phẩm'
        ),
        centerTitle: true,
      ),
      body: Obx((){
          if(controller.status.value.isLoading){
            return const Center(child: CircularProgressIndicator());
          } else if(controller.status.value.isSuccess) {
            return MasonryGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              padding: const EdgeInsets.all(24),
              itemCount: controller.listProduct.value.length,
              itemBuilder: (context, index) {
                ProductResponse product = controller.listProduct.value[index];
                return Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.category.withOpacity(0.2),
                      border: Border.all(color: AppColors.category)),
                  child: Column(
                    children: [
                      AppImage(
                        height: 80,
                        url: product.imageUrls!.isNotEmpty
                            ? product.imageUrls!.first
                            : '',
                      ),
                      const Gap(10),
                      Text(
                        product.name ?? '',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.montserrat(
                            fonWeight: FontWeight.w600, fontSize: 15),
                      ),
                      const Gap(10),
                      Text(
                        product.description ?? '',
                        style: AppTextStyles.montserrat(
                            fonWeight: FontWeight.w500, fontSize: 11),
                      )
                    ],
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
