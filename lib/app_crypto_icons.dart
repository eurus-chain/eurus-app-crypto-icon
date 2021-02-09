import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

part 'crypto_icon_loader.dart';

class AppCryptoIcons {
  /// Check if we have the icon asset
  ///
  /// return [IconSourceType] which indicates which type of icon do we have
  static Future<IconSourceType> ckIconSource(
    String symbol, {
    String imgUrl,
  }) async {
    /// Check with imgUrl
    if (imgUrl != null) return IconSourceType.url;

    String path = 'packages/app_crypto_icons/assets/${symbol.toLowerCase()}';

    /// Check svg version of the icon exists
    IconSourceType source = await rootBundle.load('$path.svg').then((v) {
      return IconSourceType.svg;
    }).catchError((e) {
      return null;
    });
    if (source != null) return source;

    /// Check png version of the icon exists
    source = await rootBundle.load('$path.png').then((v) {
      return IconSourceType.png;
    }).catchError((e) {
      return null;
    });
    if (source != null) return source;

    return IconSourceType.none;
  }

  /// Get Icon with given source
  static Widget getIcon(
    String symbol,
    double size, {
    @required IconSourceType source,
    String imgUrl,
    Widget placeholder,
  }) {
    placeholder =
        placeholder ?? Icon(Icons.monetization_on_outlined, size: size);

    return _CryptoIconLoader(
      symbol: symbol,
      size: size,
      placeholder: placeholder,
      source: source,
      imgUrl: imgUrl,
    );
  }
}

/// Indicates the source type that we have of given icon
///
/// [IconSourceType.none] : No asset found in our package
/// [IconSourceType.svg]  : Asset in svg found in our package
/// [IconSourceType.png]  : Asset in png found in our package
/// [IconSourceType.url]  : Asset from internet by given url
enum IconSourceType { none, svg, png, url }
