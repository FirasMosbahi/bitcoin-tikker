import 'package:bitcoin_tikker/screens/loading_screen.dart';
import 'package:bitcoin_tikker/utilities/animated_routing.dart';
import 'package:flutter/material.dart';
import '../services/crypto_rates_service.dart';
import '../widgets/android_currency_selector.dart';
import '../widgets/ios_currency_selector.dart';
import '../widgets/rate_text.dart';
import 'dart:io' show Platform;

class RatesScreen extends StatefulWidget {
  final CryptoRates rates;
  const RatesScreen({Key? key, required this.rates}) : super(key: key);

  @override
  State<RatesScreen> createState() => _RatesScreenState();
}

class _RatesScreenState extends State<RatesScreen> {
  void onChangedAndroid(String? value) {
    value = value ?? "";
    Navigator.of(context).push(
      animatedRouting(
        LoadingScreen(currency: value),
      ),
    );
  }

  void onChangedIOS(int value) {
    Navigator.of(context).push(
      animatedRouting(
        LoadingScreen(currency: currenciesList[value]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("bitcoin tikker 🤑"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              RateText(
                data:
                    '1 BTC = ${widget.rates.bitcoin.toStringAsFixed(2)} ${widget.rates.currency}',
              ),
              RateText(
                data:
                    '1 ETH = ${widget.rates.ethereum.toStringAsFixed(2)} ${widget.rates.currency}',
              ),
              RateText(
                data:
                    '1 USDT = ${widget.rates.tether.toStringAsFixed(2)} ${widget.rates.currency}',
              ),
              const SizedBox(
                height: 200.0,
              ),
              Platform.isIOS
                  ? IOSCurrencyPicker(
                      onChanged: onChangedIOS,
                    )
                  : AndroidCurrencySelector(
                      initialValue: "USD",
                      onChanged: onChangedAndroid,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
