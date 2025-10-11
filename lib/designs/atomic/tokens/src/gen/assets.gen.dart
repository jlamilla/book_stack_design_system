// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $LibGen {
  const $LibGen();

  /// Directory path: lib/assets
  $LibAssetsGen get assets => const $LibAssetsGen();
}

class $LibAssetsGen {
  const $LibAssetsGen();

  /// Directory path: lib/assets/colors
  $LibAssetsColorsGen get colors => const $LibAssetsColorsGen();

  /// Directory path: lib/assets/icons
  $LibAssetsIconsGen get icons => const $LibAssetsIconsGen();

  /// Directory path: lib/assets/mocks
  $LibAssetsMocksGen get mocks => const $LibAssetsMocksGen();
}

class $LibAssetsColorsGen {
  const $LibAssetsColorsGen();

  /// File path: lib/assets/colors/colors.xml
  String get colors => 'lib/assets/colors/colors.xml';

  /// List of all assets
  List<String> get values => [colors];
}

class $LibAssetsIconsGen {
  const $LibAssetsIconsGen();

  /// File path: lib/assets/icons/arrow_left.svg
  SvgGenImage get arrowLeft =>
      const SvgGenImage('lib/assets/icons/arrow_left.svg');

  /// File path: lib/assets/icons/heart.svg
  SvgGenImage get heart => const SvgGenImage('lib/assets/icons/heart.svg');

  /// File path: lib/assets/icons/link.svg
  SvgGenImage get link => const SvgGenImage('lib/assets/icons/link.svg');

  /// File path: lib/assets/icons/moon.svg
  SvgGenImage get moon => const SvgGenImage('lib/assets/icons/moon.svg');

  /// File path: lib/assets/icons/search.svg
  SvgGenImage get search => const SvgGenImage('lib/assets/icons/search.svg');

  /// File path: lib/assets/icons/star.svg
  SvgGenImage get star => const SvgGenImage('lib/assets/icons/star.svg');

  /// File path: lib/assets/icons/sun.svg
  SvgGenImage get sun => const SvgGenImage('lib/assets/icons/sun.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    arrowLeft,
    heart,
    link,
    moon,
    search,
    star,
    sun,
  ];
}

class $LibAssetsMocksGen {
  const $LibAssetsMocksGen();

  /// File path: lib/assets/mocks/subscription_plan_by_user.json
  String get subscriptionPlanByUser =>
      'lib/assets/mocks/subscription_plan_by_user.json';

  /// List of all assets
  List<String> get values => [subscriptionPlanByUser];
}

class BookStackAssets {
  const BookStackAssets._();

  static const $LibGen lib = $LibGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package = 'book_stack_design_system',
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter:
          colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
