import 'package:payment_methods/Features/data/models/payment_input_model.dart';
import 'package:payment_methods/Features/data/repos/checkout_repo.dart';

import 'checkout_payment_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class CheckoutPaymentCubit extends Cubit<CheckoutPaymentState> {
  CheckoutPaymentCubit({required this.checkoutRepo})
      : super(CheckoutPaymentInitialState());
  final CheckoutRepo checkoutRepo;
  Future<void> checkoutPayment({required PaymentInputModel paymentInputModel}) async {
    emit(CheckoutPaymentLoadingState());
    var res = await checkoutRepo.makePaymentProcess(
        paymentInputModel: paymentInputModel);
    res.fold((failure) {
      emit(CheckoutPaymentFailureState(errMessage: failure.errMessage));
    }, (r) {
      emit(CheckoutPaymentSuccessState());
    });
  }
}
