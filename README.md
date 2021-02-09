# app_crypto_icons

app_crypto_icons is a plugin specifically designed for our wallet to display 30 kinds of crypto currency icons 

## Usage
```dart
import 'package:app_crypto_icons/app_crypto_icons.dart';

/// Check if this plugin have the given token icon
///
/// return [IconSourceType] 
IconSourceType iconSourceType = await AppCryptoIcons.ckIconSource('USDT');

/// Get crypto currency icon, e.g. USDT
///
/// Provide crypto currency name [String], size [double] and [IconSourceType] to select icon
/// return [Widget] with given size
/// return [Icon] Icons.monetization_on_outlined if given crypto currency was not found in our assets
Widget usdtIcon = AppCryptoIcons.getIcon('USDT', 100, source: iconSourceType);

/// Provide custom [Widget] [placeholder] for handling crypto currency not found case
Widget usdtIcon = AppCryptoIcons.getIcon('USDT', 100, source: iconSourceType, placeholder: Icon(Icons.attach_money));
```

## Supported Icons
### 30 crypto currency are avaliable in this plugin, includes:
USDT, LINK, BUSD, USDC, YFI, DAI, OMG, UNI, VEN, AAVE, HT, TUSD, CDAI, SXP, BAT, WBTC, ZIL, SNX, OKB, BAND, MKR, HUSD, ZRX, PAX, COMP, RSR, BAL, SUSHI, USDK

## License
[MIT](https://choosealicense.com/licenses/mit/)