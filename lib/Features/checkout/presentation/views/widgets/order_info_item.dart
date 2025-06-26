import 'package:flutter/material.dart';
import 'package:payment_methods/core/utils/styles.dart';

class OrderInfoItem extends StatelessWidget {
  const OrderInfoItem(
      {super.key,
      required this.text,
      required this.price,
      this.textStyle = AppStyles.titleTextStyle18});

  final String text;
  final String price;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Text(
          '\$$price',
          style: textStyle,
        ),
      ],
    );
  }
}
