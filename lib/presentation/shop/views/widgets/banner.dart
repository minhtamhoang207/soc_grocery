import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:soc_grocery/presentation/common_widgets/cache_network_image.dart';

class ShopBanner extends StatelessWidget {
  final List<String> imgList;
  const ShopBanner({Key? key, required this.imgList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 114,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            disableCenter: true,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
          ),
          items: imgList
              .map(
                (item) => AppImage(
                    url: item, borderRadius: BorderRadius.circular(10)),
              )
              .toList(),
        ));
  }
}
