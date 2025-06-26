import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_methods/Features/checkout/presentation/manager/cubit/checkout_payment_cubit.dart';
import 'package:payment_methods/Features/data/repos/checkout_repo_impl.dart';
import 'package:payment_methods/core/utils/service_locator.dart';

import '../../../../core/utils/styles.dart';
import 'widgets/payment_details_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Payment Details',
          style: AppStyles.titleTextStyle25,
        ),
      ),
      body: BlocProvider(
        create: (context) => CheckoutPaymentCubit(
          checkoutRepo: getIt.get<CheckoutRepoImpl>()
        ),
        child: const PaymentDetailsBody(),
      ),
    );
  }
}
