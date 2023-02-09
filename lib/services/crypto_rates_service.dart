import 'package:flutter/material.dart';
import '../services/http_helper.dart';
import '../env/env.dart';
import 'dart:convert';

class CryptoRates{
  final String currency;
  final double bitcoin;
  final double ethereum;
  final double tether;
  const CryptoRates({required this.currency,required this.bitcoin,required this.ethereum,required this.tether});
  factory CryptoRates.fromJSON(String data){
    var jsonData = jsonDecode(data);
    return CryptoRates(currency: jsonData["target"],bitcoin: jsonData["rates"]["BTC"], ethereum: jsonData["rates"]["ETH"], tether: jsonData["rates"]["USDT"]);
  }
}


Future<CryptoRates> getRates(String target) async {
  String apiResponse = await httpHelper(
      'http://api.coinlayer.com/live?access_key=$COIN_LAYER_SECRET_KEY&target=$target&symbols=BTC,ETH,USDT');
  debugPrint(apiResponse);
  return CryptoRates.fromJSON(apiResponse);
}

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];