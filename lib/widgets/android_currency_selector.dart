import 'package:bitcoin_tikker/services/crypto_rates_service.dart';
import 'package:flutter/material.dart';

class AndroidCurrencySelector extends StatelessWidget {
  final String initialValue;
  final void Function(String?) onChanged;
  const AndroidCurrencySelector(
      {Key? key, required this.initialValue, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButton<String>(
        alignment: Alignment.center,
        isExpanded: false,
        menuMaxHeight: 200,
        isDense: false,
        dropdownColor: const Color(0xFA1F1D1D),
        items: currenciesList.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            alignment: Alignment.center,
            value: value,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                value,
                style: const TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
