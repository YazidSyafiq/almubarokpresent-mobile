/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/animation_not_found_lottie.json
  String get animationNotFoundLottie =>
      'assets/images/animation_not_found_lottie.json';

  /// File path: assets/images/animation_warning_lottie.json
  String get animationWarningLottie =>
      'assets/images/animation_warning_lottie.json';

  /// File path: assets/images/ic_face.png
  AssetGenImage get icFace => const AssetGenImage('assets/images/ic_face.png');

  /// File path: assets/images/ic_history.svg
  String get icHistory => 'assets/images/ic_history.svg';

  /// File path: assets/images/ic_leave.svg
  String get icLeave => 'assets/images/ic_leave.svg';

  /// File path: assets/images/ic_pin_map.png
  AssetGenImage get icPinMap =>
      const AssetGenImage('assets/images/ic_pin_map.png');

  /// File path: assets/images/ill_face_recognition_muslim.png
  AssetGenImage get illFaceRecognitionMuslim =>
      const AssetGenImage('assets/images/ill_face_recognition_muslim.png');

  /// File path: assets/images/ill_history_leave.png
  AssetGenImage get illHistoryLeave =>
      const AssetGenImage('assets/images/ill_history_leave.png');

  /// File path: assets/images/ill_on_boarding_1.png
  AssetGenImage get illOnBoarding1 =>
      const AssetGenImage('assets/images/ill_on_boarding_1.png');

  /// File path: assets/images/ill_on_boarding_2.png
  AssetGenImage get illOnBoarding2 =>
      const AssetGenImage('assets/images/ill_on_boarding_2.png');

  /// File path: assets/images/ill_on_boarding_3.png
  AssetGenImage get illOnBoarding3 =>
      const AssetGenImage('assets/images/ill_on_boarding_3.png');

  /// File path: assets/images/img_bg_profile.jpg
  AssetGenImage get imgBgProfile =>
      const AssetGenImage('assets/images/img_bg_profile.jpg');

  /// File path: assets/images/img_bg_putih.png
  AssetGenImage get imgBgPutih =>
      const AssetGenImage('assets/images/img_bg_putih.png');

  /// File path: assets/images/img_logo.png
  AssetGenImage get imgLogo =>
      const AssetGenImage('assets/images/img_logo.png');

  /// File path: assets/images/img_logo_horizontal.png
  AssetGenImage get imgLogoHorizontal =>
      const AssetGenImage('assets/images/img_logo_horizontal.png');

  /// File path: assets/images/img_logo_putih.png
  AssetGenImage get imgLogoPutih =>
      const AssetGenImage('assets/images/img_logo_putih.png');

  /// List of all assets
  List<dynamic> get values => [
        animationNotFoundLottie,
        animationWarningLottie,
        icFace,
        icHistory,
        icLeave,
        icPinMap,
        illFaceRecognitionMuslim,
        illHistoryLeave,
        illOnBoarding1,
        illOnBoarding2,
        illOnBoarding3,
        imgBgProfile,
        imgBgPutih,
        imgLogo,
        imgLogoHorizontal,
        imgLogoPutih
      ];
}

class $AssetsModelGen {
  const $AssetsModelGen();

  /// File path: assets/model/mobile_face_net.tflite
  String get mobileFaceNet => 'assets/model/mobile_face_net.tflite';

  /// List of all assets
  List<String> get values => [mobileFaceNet];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsModelGen model = $AssetsModelGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

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
    bool gaplessPlayback = true,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
