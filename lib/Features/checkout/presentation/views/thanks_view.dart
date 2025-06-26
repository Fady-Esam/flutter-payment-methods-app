import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payment_methods/Features/checkout/presentation/views/widgets/order_info_item.dart';
import 'package:payment_methods/core/utils/styles.dart';

class ThanksView extends StatelessWidget {
  const ThanksView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: double.infinity,
            margin:
                const EdgeInsets.only(right: 35, left: 35, bottom: 60, top: 50),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color(0xffd9d9d9),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 65),
                  const Text(
                    'Thank You!',
                    style: AppStyles.titleTextStyle24,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Your transaction was successful',
                    style: AppStyles.titleTextStyle18,
                  ),
                  const SizedBox(height: 18),
                  const PaymentItemInfo(title: 'Date', titleData: '01/24/2023'),
                  const SizedBox(height: 12),
                  const PaymentItemInfo(title: 'Time', titleData: '10:15 AM'),
                  const SizedBox(height: 12),
                  const PaymentItemInfo(title: 'To', titleData: 'Sam Louis'),
                  const SizedBox(height: 18),
                  const Divider(
                    thickness: 3,
                  ),
                  const SizedBox(height: 12),
                  const OrderInfoItem(
                    text: 'Total',
                    price: '50.97',
                    textStyle: AppStyles.titleTextStyle24,
                  ),
                  const SizedBox(height: 22),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(18),
                        color: Colors.white),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/master_card.svg',
                          height: 30,
                        ),
                        const SizedBox(width: 18),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Credit Card',
                              style: AppStyles.titleTextStyle18,
                            ),
                            Text(
                              'Mastercard **78',
                              style: AppStyles.titleTextStyle18,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        FontAwesomeIcons.barcode,
                        size: 80,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 28,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          border: const Border.fromBorderSide(
                            BorderSide(
                              color: Colors.green,
                              width: 3,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'PAID',
                            style: AppStyles.titleTextStyle24.copyWith(
                              color: Colors.green,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 500,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
            ),
          ),
          const Positioned(
            top: 500,
            left: 350,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 25,
            ),
          ),
          Positioned(
            top: 525,
            left: 55,
            right: 65,
            child: Row(
              children: List.generate(
                20,
                (index) => Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    color: const Color(0xffb8b8b8),
                    height: 2,
                  ),
                ),
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: CircleAvatar(
              radius: 60,
              backgroundColor: Color(0xffd9d9d9),
              child: CircleAvatar(
                backgroundColor: Colors.green,
                radius: 50,
                child: Icon(
                  Icons.check,
                  size: 70,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PaymentItemInfo extends StatelessWidget {
  const PaymentItemInfo({
    super.key,
    required this.title,
    required this.titleData,
  });

  final String title, titleData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.titleTextStyle18,
        ),
        Text(
          titleData,
          style: AppStyles.titleTextStyle20,
        ),
      ],
    );
  }
}
