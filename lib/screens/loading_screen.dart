import 'package:bitcoin_tikker/screens/crypto_rates_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import '../utilities/animated_routing.dart';
import '../services/crypto_rates_service.dart';

class LoadingScreen extends StatefulWidget {
  final String currency;
  const LoadingScreen({Key? key, required this.currency}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getCryptoData();
  }

  void getCryptoData() async {
    CryptoRates cryptoRates = await getRates(widget.currency);
    //CryptoRates rates = await getRates(widget.currency);
    Navigator.of(context).push(
      animatedRouting(
        RatesScreen(rates: cryptoRates),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: LoadingAnimationWidget.inkDrop(
          color: Colors.black38,
          size: 200,
        ),
      ),
    );
  }
}