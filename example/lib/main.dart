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
  @override
  void initState() {
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
                    children: [
                      _iconName('usdt'),
                      _iconName('link'),
                      _iconName('busd'),
                      _iconName('usdc'),
                      _iconName('yfi'),
                      _iconName('dai'),
                      _iconName('omg'),
                      _iconName('uni'),
                      _iconName('ven'),
                      _iconName('aave'),
                      _iconName('ht'),
                      _iconName('sushi'),
                      _iconName('tusd'),
                      _iconName('cdai'),
                      _iconName('sxp'),
                      _iconName('bat'),
                      _iconName('usdk'),
                      _iconName('wbtc'),
                      _iconName('zil'),
                      _iconName('snx'),
                      _iconName('okb'),
                      _iconName('band'),
                      _iconName('mkr'),
                      _iconName('husd'),
                      _iconName('zrx'),
                      _iconName('pax'),
                      _iconName('comp'),
                      _iconName('rsr'),
                      _iconName('bal'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Display icon with name underneath
  Widget _iconName(String symbol, {Widget placeholder}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppCryptoIcons.getIcon(symbol, 100, placeholder: placeholder),
        Text(symbol),
      ],
    );
  }
}
