import 'package:flutter/material.dart';

import 'package:app_crypto_icons/app_crypto_icons.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<CIcon> _cryptoIcons = [];

  @override
  void initState() {
    _initIcons();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Wrap(
                    spacing: 2,
                    children: _cryptoIcons
                        .map((e) => _iconName(e.symbol, source: e.source))
                        .toList(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _initIcons() async {
    List<String> cList = [
      'usdt',
      'link',
      'busd',
      'usdc',
      'yfi',
      'dai',
      'omg',
      'uni',
      'ven',
      'aave',
      'ht',
      'sushi',
      'tusd',
      'cdai',
      'sxp',
      'bat',
      'usdk',
      'wbtc',
      'zil',
      'snx',
      'okb',
      'band',
      'mkr',
      'husd',
      'zrx',
      'pax',
      'comp',
      'rsr',
      'bal'
    ];

    List<CIcon> dummyList = [];

    for (var c in cList) {
      dummyList.add(
        CIcon(symbol: c, source: await AppCryptoIcons.ckIconSource(c)),
      );
    }

    setState(() {
      _cryptoIcons = dummyList;
    });
  }

  /// Display icon with name underneath
  Widget _iconName(String symbol,
      {Widget? placeholder, required IconSourceType source}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppCryptoIcons.getIcon(symbol, 100,
            placeholder: placeholder, source: source),
        Text(symbol),
      ],
    );
  }
}

class CIcon {
  CIcon({
    required this.symbol,
    required this.source,
  });

  final String symbol;
  final IconSourceType source;
}
