part of 'app_crypto_icons.dart';

/// Crypto Icon Loader
class _CryptoIconLoader extends StatefulWidget {
  _CryptoIconLoader({
    @required this.size,
    @required this.symbol,
    this.placeholder,
  });

  final double size;
  final String symbol;
  // Widget to be display if icon is not found
  final Widget placeholder;

  _CryptoIconLoaderState createState() => _CryptoIconLoaderState();
}

class _CryptoIconLoaderState extends State<_CryptoIconLoader> {
  Widget cryptoIcon;

  @override
  void initState() {
    /// Try to load the crypto with given symbol
    _trySetCryptoIcon();
    super.initState();
  }

  @override
  Widget build(BuildContext _) {
    return Container(
      width: widget.size,
      height: widget.size,
      child: cryptoIcon ?? widget.placeholder,
    );
  }

  void _trySetCryptoIcon() async {
    String path =
        'packages/app_crypto_icons/assets/${widget.symbol.toLowerCase()}';

    /// Check if we have the icon
    var iconExists = await rootBundle.load('$path.svg').then((v) {
      return true;
    }).catchError((e) {
      return false;
    });

    /// Show crypto icon if have the icon asset
    if (iconExists) {
      setState(() {
        cryptoIcon = SvgPicture.asset(
          'assets/${widget.symbol.toLowerCase()}.svg',
          package: 'app_crypto_icons',
          placeholderBuilder: (BuildContext _) {
            return widget.placeholder;
          },
        );
      });

      return;
    }

    /// Check if png ver exists
    iconExists = await rootBundle.load('$path.png').then((v) {
      return true;
    }).catchError((e) {
      return false;
    });

    /// Show crypto icon if have the icon asset
    if (iconExists) {
      setState(() {
        cryptoIcon = Image.asset(
          'assets/${widget.symbol.toLowerCase()}.png',
          package: 'app_crypto_icons',
        );
      });
    }
  }
}
