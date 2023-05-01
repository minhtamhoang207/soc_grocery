import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/config/assets.gen.dart';

import '../controllers/shop_controller.dart';

class ShopView extends GetView<ShopController> {
  const ShopView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SvgPicture.asset(Assets.icons.icCarrot),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.icons.icLocation),
              const Gap(10),
              const Text('Tan My, Van Lang, Lang Son')
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: AppColors.lightGray.withOpacity(0.5),
                border: InputBorder.none,
                hintText: 'Tìm kiếm sản phẩm',
                prefixIcon: const Icon(CupertinoIcons.search, color: Colors.black)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Text(
              'Excluisve offer',
              style: AppTextStyles.montserrat(
                fontSize: 18
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 6,
              padding: const EdgeInsets.only(left: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width / 2,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(left: 12, right: 12, bottom: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AppColors.primary,
                      width: 1
                    )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Image.network(
                          'https://www.gardeningknowhow.com/wp-content/uploads/2021/05/whole-and-slices-watermelon.jpg',
                          fit: BoxFit.cover,
                        )
                      ),
                      const Gap(10),
                      Text(
                        'Dưa hấu Mai An Tiêm',
                        style: AppTextStyles.montserrat(
                          fontSize: 18,
                          fonWeight: FontWeight.bold
                        ),
                      ),
                      const Gap(15),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              '100,000đ',
                              style: AppTextStyles.montserrat(
                                  fontSize: 16,
                                  fonWeight: FontWeight.bold,
                                  color: AppColors.textGray
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: AppColors.primary,
                                shape: BoxShape.circle
                            ),
                            padding: const EdgeInsets.all(3),
                            child: Icon(Icons.add, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          const Gap(15),
          Padding(
            padding: const EdgeInsets.only(left: 25, bottom: 15),
            child: Text(
              'Best seller',
              style: AppTextStyles.montserrat(
                  fontSize: 18
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 6,
              padding: const EdgeInsets.only(left: 25),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: Get.width / 2,
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.only(
                      left: 12, right: 12, bottom: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColors.primary,
                          width: 1
                      )
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: Image.network(
                            'https://www.gardeningknowhow.com/wp-content/uploads/2021/05/whole-and-slices-watermelon.jpg',
                            fit: BoxFit.cover,
                          )
                      ),
                      const Gap(10),
                      Text(
                        'Dưa hấu Mai An Tiêm',
                        style: AppTextStyles.montserrat(
                            fontSize: 18,
                            fonWeight: FontWeight.bold
                        ),
                      ),
                      Text(
                        '100,000đ',
                        style: AppTextStyles.montserrat(
                            fontSize: 16,
                            fonWeight: FontWeight.bold,
                            color: AppColors.textGray
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          decoration: BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle
                          ),
                          padding: const EdgeInsets.all(3),
                          child: Icon(Icons.add, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
