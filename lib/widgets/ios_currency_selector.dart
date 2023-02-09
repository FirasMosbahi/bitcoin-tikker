import 'package:bitcoin_tikker/services/crypto_rates_service.dart';
import 'package:flutter/cupertino.dart';

class IOSCurrencyPicker extends StatelessWidget {
  final void Function(int) onChanged;
  const IOSCurrencyPicker({Key? key, required this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        itemExtent: 32.0,
        backgroundColor: CupertinoColors.activeBlue,
        onSelectedItemChanged: onChanged,
        children: currenciesList.map<Text>((String value) {
          return Text(value);
        }).toList(),);
  }
}
