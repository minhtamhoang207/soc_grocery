/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/ic_carrot.svg
  String get icCarrot => 'assets/icons/ic_carrot.svg';

  /// File path: assets/icons/ic_cart.svg
  String get icCart => 'assets/icons/ic_cart.svg';

  /// File path: assets/icons/ic_explore.svg
  String get icExplore => 'assets/icons/ic_explore.svg';

  /// File path: assets/icons/ic_heart.svg
  String get icHeart => 'assets/icons/ic_heart.svg';

  /// File path: assets/icons/ic_location.svg
  String get icLocation => 'assets/icons/ic_location.svg';

  /// File path: assets/icons/ic_person.svg
  String get icPerson => 'assets/icons/ic_person.svg';

  /// File path: assets/icons/ic_shop.svg
  String get icShop => 'assets/icons/ic_shop.svg';

  /// List of all assets
  List<String> get values =>
      [icCarrot, icCart, icExplore, icHeart, icLocation, icPerson, icShop];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/ic_manage_clan.png
  AssetGenImage get icManageClan =>
      const AssetGenImage('assets/images/ic_manage_clan.png');

  /// List of all assets
  List<AssetGenImage> get values => [icManageClan];
}

class $AssetsLottiesGen {
  const $AssetsLottiesGen();

  /// File path: assets/lotties/lottie_splash.json
  String get lottieSplash => 'assets/lotties/lottie_splash.json';

  /// List of all assets
  List<String> get values => [lottieSplash];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottiesGen lotties = $AssetsLottiesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider() => AssetImage(_assetName);

  String get path => _assetName;

  String get keyName => _assetName;
}
