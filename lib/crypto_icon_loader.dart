part of 'app_crypto_icons.dart';

/// Crypto Icon Loader
class _CryptoIconLoader extends StatefulWidget {
  _CryptoIconLoader({
    required this.size,
    required this.symbol,
    required this.source,
    this.imgUrl,
    this.placeholder,
  });

  final double size;
  final String symbol;
  final IconSourceType source;
  final String? imgUrl;
  // Widget to be display if icon is not found
  final Widget? placeholder;

  _CryptoIconLoaderState createState() => _CryptoIconLoaderState();
}

class _CryptoIconLoaderState extends State<_CryptoIconLoader> {
  @override
  Widget build(BuildContext _) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: _iconSourceSwitch(),
    );
  }

  Widget? _iconSourceSwitch() {
    switch (widget.source) {
      case IconSourceType.svg:
        return _getSvgIcon();
      case IconSourceType.png:
        return _getPngIcon();
      case IconSourceType.url:
        return _getUrlIcon();
      default:
        return widget.placeholder;
    }
  }

  Widget _getSvgIcon() {
    return SvgPicture.asset(
      'assets/${widget.symbol.toLowerCase()}.svg',
      package: 'app_crypto_icons',
      placeholderBuilder: widget.placeholder != null
          ? (BuildContext _) {
              return widget.placeholder!;
            }
          : null,
    );
  }

  Widget _getPngIcon() {
    return Image.asset(
      'assets/${widget.symbol.toLowerCase()}.png',
      package: 'app_crypto_icons',
      errorBuilder: widget.placeholder == null
          ? (_, o, s) {
              return widget.placeholder!;
            }
          : null,
    );
  }

  Widget? _getUrlIcon() {
    if (widget.imgUrl == null) return widget.placeholder;

    return Image.network(
      widget.imgUrl!,
      errorBuilder: widget.placeholder != null
          ? (_, o, s) {
              return widget.placeholder!;
            }
          : null,
    );
  }
}
