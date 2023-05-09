import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_colors.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';
import 'package:soc_grocery/app/util/util.dart';
import 'package:soc_grocery/data/models/response/product_response.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';

import '../controllers/cart_controller.dart';

class CartView extends GetView<CartController> {
  const CartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
            'Giỏ hàng',
            style: TextStyle(
              color: Colors.black
            ),
        ),
        centerTitle: true,
      ),
      body: Cart(controller: controller),
      // body: MyApp(),
    );
  }
}

class Cart extends StatefulWidget {
  final CartController controller;
  const Cart({Key? key, required this.controller}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  late final CartController controller;

  @override
  void initState() {
    controller = widget.controller;
    controller.getCart();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status.value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (controller.status.value.isSuccess) {
        return Column(
          children: [
            Divider(color: AppColors.primary),
            Expanded(
              child: controller.cart.value.isEmpty
                  ? const SizedBox()
                  : ListView.separated(
                      itemBuilder: (context, index) {
                        ProductResponse? product =
                            controller.cart.value.first.items?[index].product;

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
                          child: Row(
                            children: [
                              AppImage(
                                url: (product?.imageUrls?.isNotEmpty ?? false)
                                      ? product?.imageUrls?.first ?? ''
                                      : ''  ,
                                height: 60,
                                width: 60,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              const Gap(25),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      product?.name ?? '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTextStyles.montserrat(
                                        fontSize: 18,
                                        fonWeight: FontWeight.w700
                                      ),
                                    ),
                                    const Gap(20),
                                    Row(
                                      children: [
                                        const Gap(5),
                                        IconButton(
                                            onPressed: () {
                                              if((controller.cart
                                                  .value.first
                                                  .items?[index].quantity ??
                                                  0) > 1) {
                                                controller.updateItem(
                                                    productID: product?.id ??
                                                        '',
                                                    quantity: (controller.cart
                                                        .value.first
                                                        .items?[index]
                                                        .quantity ??
                                                        0) - 1
                                                );
                                              } else {
                                                controller.deleteItem(productID: product?.id ?? '');
                                              }
                                            },
                                            icon: const Icon(
                                                CupertinoIcons.minus)),
                                        Container(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 6),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius
                                                    .circular(8),
                                                border:
                                                Border.all(
                                                    color: AppColors.textGray
                                                        .withOpacity(0.8))),
                                            child: Text(
                                              '${controller.cart.value.first
                                                  .items?[index].quantity ?? 0}',
                                              style: AppTextStyles.montserrat(
                                                  fonWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              controller.updateItem(
                                                  productID: product?.id ??
                                                      '',
                                                  quantity: (controller.cart
                                                      .value.first
                                                      .items?[index]
                                                      .quantity ??
                                                      0) + 1
                                              );
                                            },
                                            icon: Icon(CupertinoIcons.add,
                                                color: AppColors.primary)),
                                        const Gap(20)
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Gap(20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        controller.deleteItem(
                                            productID: product?.id ?? '');
                                      },
                                      icon: const Icon(CupertinoIcons.delete_solid, color: Colors.redAccent,)
                                  ),
                                  const Gap(20),
                                  Text(
                                    Utils.formatCurrency(
                                        (controller.cart.value.first.items?[index].quantity ?? 0)
                                            * (product?.price ?? 0)
                                    ),
                                    style: AppTextStyles.montserrat(
                                      fonWeight: FontWeight.bold,
                                      fontSize: 15
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );

                        // return ListTile(
                        //   title: Text(product?.name ?? ''),
                        //   trailing: Row(
                        //     mainAxisSize: MainAxisSize.min,
                        //     children: [
                        //       Text(
                        //           'Số lượng: ${controller.cart.value.first
                        //               .items?[index].quantity ?? 0}'
                        //       ),
                        //       IconButton(
                        //           onPressed: () {
                        //             controller.deleteItem(productID: product?.id ?? '');
                        //           },
                        //           icon: const Icon(CupertinoIcons.delete)
                        //       )
                        //     ],
                        //   ),
                        //   subtitle: Text((product?.quantity ?? 0).toString()),
                        // );
                      },
                      separatorBuilder: (_, __) =>
                          Divider(thickness: 1, color: AppColors.primary),
                      itemCount: controller.cart.value.first.items?.length ?? 0),
            ),
            Container(
              margin:
                  const EdgeInsets.only(bottom: 30, left: 5, right: 5, top: 15),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
              decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.15),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(3)),
              child: Row(
                children: [
                  const Text(
                    'Tổng thanh toán',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Text(
                      Utils.formatCurrency(controller.cart.value.isEmpty
                          ? 0
                          : controller.cart.value.first.total ?? 0),
                      textAlign: TextAlign.end,
                      style: TextStyle(
                          color: AppColors.primary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      } else {
        return Center(
          child: Text(controller.status.value.errorMessage ?? ''),
        );
      }
    });
  }
}
