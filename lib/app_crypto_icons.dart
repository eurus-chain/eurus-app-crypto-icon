import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

part 'crypto_icon_loader.dart';

class AppCryptoIcons {
  static Widget getIcon(String symbol, double size, {Widget placeholder}) {
    placeholder = placeholder ?? Icon(Icons.monetization_on_outlined, size: size);

    return _CryptoIconLoader(
      symbol: symbol,
      size: size,
      placeholder: placeholder,
    );
  }
}
