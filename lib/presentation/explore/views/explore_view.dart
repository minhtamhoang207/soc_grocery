import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/data/models/response/category_response.dart';

import '../../../app/config/app_colors.dart';
import '../controllers/explore_controller.dart';

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
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
              child: TextField(
                onChanged: (value) {
                  controller.searchCategory(keyword: value);
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.lightGray.withOpacity(0.5),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(top: 15),
                    hintText: 'Tìm kiếm...',
                    prefixIcon:
                        const Icon(CupertinoIcons.search, color: Colors.black)),
              ),
            ),
            Expanded(
                child: Obx(() => GridView.builder(
                      itemCount: controller.listCategory.value.length,
                      padding: const EdgeInsets.only(
                          left: 25, right: 15, bottom: 20),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 3 / 3.5,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        CategoryResponse category =
                            controller.listCategory.value[index];
                        return Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.category.withOpacity(0.2),
                              border: Border.all(color: AppColors.category)),
                          child: Column(
                            children: [
                              Expanded(
                                child: Image.network(
                                  'https://static.vecteezy.com/system/resources/previews/001/201/706/original/cake-png.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const Gap(10),
                              Text(
                                category.name ?? '',
                                style: AppTextStyles.montserrat(
                                    fonWeight: FontWeight.w600, fontSize: 15),
                              ),
                              const Gap(3),
                              Text(
                                category.description ?? '',
                                style: AppTextStyles.montserrat(
                                    fonWeight: FontWeight.w500, fontSize: 11),
                              )
                            ],
                          ),
                        );
                      },
                    )))
          ],
        ));
  }
}
