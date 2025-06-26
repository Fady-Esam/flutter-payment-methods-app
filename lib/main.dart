import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/core/utils/secret_keys.dart';
import 'package:payment_methods/core/utils/service_locator.dart';
import 'package:payment_methods/core/utils/simple_bloc_obsrver.dart';
import 'Features/checkout/presentation/views/my_cart_view.dart';

void main() {
  setUpServiceLocator();
  Stripe.publishableKey = SecretKeys.stripePublishKey;
  Bloc.observer = SimpleBlocObserver();
  runApp(const CheckOutApp());
}

class CheckOutApp extends StatelessWidget {
  const CheckOutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyCartView(),
    );
  }
}
//? create paymentIntent(amount, currency, customerId)
//? create ephemeralKey(customerId, stripeVersion)
//? init paymentsheet
//? present(display) paymentSheet

