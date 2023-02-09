import 'package:flutter/material.dart';

class RateText extends StatelessWidget {
  final String data;
  const RateText({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 8.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.0),
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
      child: Text(
        data,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28.0,
          fontWeight: FontWeight.w400,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
