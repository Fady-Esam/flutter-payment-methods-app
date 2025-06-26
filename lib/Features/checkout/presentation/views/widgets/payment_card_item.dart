import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem(
      {super.key, required this.image, required this.isActive});
  final String image;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      alignment: Alignment.center,
      duration: const Duration(milliseconds: 1000),
      width: 150,
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
      margin: const EdgeInsets.symmetric(horizontal: 22),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(22),
        ),
        border: Border.fromBorderSide(
          BorderSide(
            color: isActive ? Colors.green : Colors.grey,
            width: 3,
          ),
        ),
      ),
      child: SvgPicture.asset(
        image,
        height: 40,
      ),
    );
  }
}
