import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

part 'crypto_icon_loader.dart';

class AppCryptoIcons {
  static Future<IconSourceType> ckIconSource(
    String symbol, {
    String uri,
  }) async {
    String path = 'packages/app_crypto_icons/assets/${symbol.toLowerCase()}';

    /// Check
    IconSourceType source = await rootBundle.load('$path.svg').then((v) {
      return IconSourceType.svg;
    }).catchError((e) {
      return null;
    });
    if (source != null) return source;

    /// Check
    source = await rootBundle.load('$path.png').then((v) {
      return IconSourceType.png;
    }).catchError((e) {
      return null;
    });

    if (source != null) return source;

    return IconSourceType.none;
  }

  /// Get Icon with given source
  static Widget getIcon(String symbol, double size,
      {Widget placeholder, IconSourceType source}) {
    placeholder =
        placeholder ?? Icon(Icons.monetization_on_outlined, size: size);

    return _CryptoIconLoader(
      symbol: symbol,
      size: size,
      placeholder: placeholder,
      source: source,
    );
  }
}

enum IconSourceType { none, svg, png }
