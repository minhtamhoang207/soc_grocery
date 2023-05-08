import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../app/config/assets.gen.dart';

class AppImage extends StatefulWidget {
  final double? height;
  final double? width;
  final String url;
  final BorderRadius? borderRadius;
  final List<BoxShadow>? boxShadow;
  final Color? color;
  final BoxShape boxShape;
  const AppImage(
      {Key? key,
      this.height,
      this.width,
      this.url = 'https://liftlearning.com/wp-content/uploads/2020/09/default-image.png',
      this.borderRadius,
      this.boxShadow,
      this.color = Colors.white,
      this.boxShape = BoxShape.rectangle})
      : super(key: key);

  @override
  State<AppImage> createState() => _AppImageState();
}

class _AppImageState extends State<AppImage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return CachedNetworkImage(
      imageUrl: widget.url,
      imageBuilder: (context, imageProvider) =>
          _image(success: true, url: widget.url, imageProvider: imageProvider),
      placeholder: (context, url) =>
          _image(success: false, url: widget.url),
      errorWidget: (context, url, error) =>
          _image(success: false, url: widget.url)
    );
  }

  Widget _image(
      {required bool success,
      required String url,
      ImageProvider<Object>? imageProvider}) {
    return Container(
            height: widget.height,
            width: widget.width,
            decoration: BoxDecoration(
                borderRadius: widget.borderRadius,
                boxShadow: widget.boxShadow,
                color: widget.color,
                shape: widget.boxShape,
                image: imageProvider != null
                    ? DecorationImage(image: imageProvider, fit: BoxFit.cover)
                    : DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(Assets.images.imgDefault.path))),
          );
  }

  @override
  bool get wantKeepAlive => true;
}
