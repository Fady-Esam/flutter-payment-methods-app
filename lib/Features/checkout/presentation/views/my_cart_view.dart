import 'package:flutter/material.dart';
import 'package:payment_methods/core/utils/styles.dart';

import 'widgets/my_cart_view_body.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: AppStyles.titleTextStyle25,
        ),
      ),
      body: const MyCartViewBody(),
    );
  }
}
