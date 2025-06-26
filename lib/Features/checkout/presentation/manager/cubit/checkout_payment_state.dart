class CheckoutPaymentState {}

class CheckoutPaymentInitialState extends CheckoutPaymentState {}

class CheckoutPaymentLoadingState extends CheckoutPaymentState {}

class CheckoutPaymentFailureState extends CheckoutPaymentState {
  final String errMessage;

  CheckoutPaymentFailureState({required this.errMessage});
}

class CheckoutPaymentSuccessState extends CheckoutPaymentState {}
