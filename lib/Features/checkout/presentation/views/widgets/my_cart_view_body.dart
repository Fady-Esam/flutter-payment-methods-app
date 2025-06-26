import 'package:flutter/material.dart';
import 'package:payment_methods/core/utils/extentions/navigator_extention.dart';
import '../../../../../core/utils/styles.dart';
import '../payment_details.dart';
import 'custom_checkout_button.dart';
import 'order_info_item.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(height: 18),
          const OrderInfoItem(
            text: 'Order Subtotal',
            price: '42.97',
          ),
          const OrderInfoItem(
            text: 'Discount',
            price: '0',
          ),
          const OrderInfoItem(
            text: 'Shipping',
            price: '8',
          ),
          const SizedBox(height: 18),
          const Divider(thickness: 3),
          const SizedBox(height: 8),
          const OrderInfoItem(
            text: 'Total',
            price: '50.97',
            textStyle: AppStyles.titleTextStyle24,
          ),
          const SizedBox(height: 12),
          CustomButton(
            title: 'Complete Payment',
            onTap: () {
              context.pushToView(view: const PaymentDetailsView());
            },
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
