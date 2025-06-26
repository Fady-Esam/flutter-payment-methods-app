import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, required this.onTap});

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.green),
        child: Text(
          title,
          style: AppStyles.titleTextStyle24,
        ),
      ),
    );
  }
}
