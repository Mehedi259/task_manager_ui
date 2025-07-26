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

  /// File path: assets/icons/back.png
  AssetGenImage get back => const AssetGenImage('assets/icons/back.png');

  /// File path: assets/icons/delete_account.png
  AssetGenImage get deleteAccount =>
      const AssetGenImage('assets/icons/delete_account.png');

  /// File path: assets/icons/delete_alart.png
  AssetGenImage get deleteAlart =>
      const AssetGenImage('assets/icons/delete_alart.png');

  /// File path: assets/icons/delete_task.png
  AssetGenImage get deleteTask =>
      const AssetGenImage('assets/icons/delete_task.png');

  /// File path: assets/icons/discription.png
  AssetGenImage get discription =>
      const AssetGenImage('assets/icons/discription.png');

  /// File path: assets/icons/email.png
  AssetGenImage get email => const AssetGenImage('assets/icons/email.png');

  /// File path: assets/icons/help.png
  AssetGenImage get help => const AssetGenImage('assets/icons/help.png');

  /// File path: assets/icons/icon.jpeg
  AssetGenImage get icon => const AssetGenImage('assets/icons/icon.jpeg');

  /// File path: assets/icons/icon1.jpg
  AssetGenImage get icon1 => const AssetGenImage('assets/icons/icon1.jpg');

  /// File path: assets/icons/icon2.jpg
  AssetGenImage get icon2 => const AssetGenImage('assets/icons/icon2.jpg');

  /// File path: assets/icons/location.png
  AssetGenImage get location =>
      const AssetGenImage('assets/icons/location.png');

  /// File path: assets/icons/lock.png
  AssetGenImage get lock => const AssetGenImage('assets/icons/lock.png');

  /// File path: assets/icons/logout.png
  AssetGenImage get logout => const AssetGenImage('assets/icons/logout.png');

  /// File path: assets/icons/policy.png
  AssetGenImage get policy => const AssetGenImage('assets/icons/policy.png');

  /// File path: assets/icons/profile_edit.png
  AssetGenImage get profileEdit =>
      const AssetGenImage('assets/icons/profile_edit.png');

  /// File path: assets/icons/profile_icon.png
  AssetGenImage get profileIcon =>
      const AssetGenImage('assets/icons/profile_icon.png');

  /// File path: assets/icons/setting.png
  AssetGenImage get setting => const AssetGenImage('assets/icons/setting.png');

  /// File path: assets/icons/task_bg.png
  AssetGenImage get taskBg => const AssetGenImage('assets/icons/task_bg.png');

  /// File path: assets/icons/task_edit.png
  AssetGenImage get taskEdit =>
      const AssetGenImage('assets/icons/task_edit.png');

  /// File path: assets/icons/title.png
  AssetGenImage get title => const AssetGenImage('assets/icons/title.png');

  /// File path: assets/icons/trems.png
  AssetGenImage get trems => const AssetGenImage('assets/icons/trems.png');

  /// File path: assets/icons/user.png
  AssetGenImage get user => const AssetGenImage('assets/icons/user.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        back,
        deleteAccount,
        deleteAlart,
        deleteTask,
        discription,
        email,
        help,
        icon,
        icon1,
        icon2,
        location,
        lock,
        logout,
        policy,
        profileEdit,
        profileIcon,
        setting,
        taskBg,
        taskEdit,
        title,
        trems,
        user
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/img.png
  AssetGenImage get img => const AssetGenImage('assets/images/img.png');

  /// File path: assets/images/img1.png
  AssetGenImage get img1 => const AssetGenImage('assets/images/img1.png');

  /// File path: assets/images/img2.png
  AssetGenImage get img2 => const AssetGenImage('assets/images/img2.png');

  /// File path: assets/images/img3.png
  AssetGenImage get img3 => const AssetGenImage('assets/images/img3.png');

  /// File path: assets/images/img4.png
  AssetGenImage get img4 => const AssetGenImage('assets/images/img4.png');

  /// File path: assets/images/img5.png
  AssetGenImage get img5 => const AssetGenImage('assets/images/img5.png');

  /// File path: assets/images/img6.png
  AssetGenImage get img6 => const AssetGenImage('assets/images/img6.png');

  /// List of all assets
  List<AssetGenImage> get values => [img, img1, img2, img3, img4, img5, img6];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
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
    FilterQuality filterQuality = FilterQuality.medium,
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
