import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';
import 'package:soc_grocery/data/models/response/category_response.dart';

import '../../../app/config/app_colors.dart';
import '../../../app/routes/app_pages.dart';
import '../controllers/explore_controller.dart';

class CategoryArgument {
  String? id;
  String? name;

  CategoryArgument({this.id, this.name});
}

class ExploreView extends GetView<ExploreController> {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          centerTitle: true,
          elevation: 0,
          title: Text(
            'Danh mục',
            style: AppTextStyles.montserrat(
                fonWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Obx(() => controller.recognizing.value
                  ? Lottie.asset(Assets.lotties.lottieWave, height: 100, width: 200)
                  : const SizedBox()
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: TextField(
                onChanged: (value) {
                  controller.searchCategory(keyword: value);
                },
                controller: controller.searchController.value,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightGray.withOpacity(0.5),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 15),
                    hintText: 'Tìm kiếm...',
                    suffixIcon:
                    Obx(() =>
                    controller.recognizing.value
                        ? IconButton(
                            onPressed: () {
                              controller.stop();
                            },
                            icon: const Icon(CupertinoIcons.stop_circle_fill),
                          )
                        : IconButton(
                      onPressed: () {
                        controller.start();
                      },
                      icon: const Icon(CupertinoIcons.mic),
                    ),
                    ),
                    prefixIcon:
                        const Icon(CupertinoIcons.search, color: Colors.black)),
              ),
            ),
            Expanded(
                child: Obx(() => RefreshIndicator(
                  onRefresh: () async {
                    controller.onInit();
                  },
                  child: MasonryGridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 15,
                        crossAxisSpacing: 15,
                        padding: const EdgeInsets.all(24),
                        itemCount: controller.listCategory.value.length,
                        itemBuilder: (context, index) {
                          CategoryResponse category =
                              controller.listCategory.value[index];
                          return InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LIST_PRODUCT, arguments: CategoryArgument(
                                id: category.id ?? '',
                                name: category.name ?? ''
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.category.withOpacity(0.2),
                                  border: Border.all(color: AppColors.category)),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                    Assets.icons.icCategory,
                                    height: 30,
                                    width: 30,
                                  ),
                                  const Gap(25),
                                  Text(
                                    category.name ?? '',
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.montserrat(
                                        fonWeight: FontWeight.w600, fontSize: 15),
                                  ),
                                  const Gap(10),
                                  Text(
                                    category.description ?? '',
                                    style: AppTextStyles.montserrat(
                                        fonWeight: FontWeight.w500, fontSize: 11),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                ))
            ),
          ],
        ));
  }
}
