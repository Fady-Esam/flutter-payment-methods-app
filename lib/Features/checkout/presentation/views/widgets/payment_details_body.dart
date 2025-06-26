import 'package:flutter/material.dart';
import 'custom_credit_card.dart';
import 'payment_card_item.dart';

class PaymentDetailsBody extends StatefulWidget {
  const PaymentDetailsBody({super.key});

  @override
  State<PaymentDetailsBody> createState() => _PaymentDetailsBodyState();
}

class _PaymentDetailsBodyState extends State<PaymentDetailsBody> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<String> methodsImages = [
      'assets/images/card.svg',
      'assets/images/paypal.svg',
    ];
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: methodsImages.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      currentIndex = index;
                      setState(() {});
                    },
                    child: PaymentCardItem(
                      image: methodsImages[index],
                      isActive: currentIndex == index,
                    ),
                  );
                },
              ),
            ),
            const CustomCreditCard(),
          ],
        ),
      ),
    );
  }
}
