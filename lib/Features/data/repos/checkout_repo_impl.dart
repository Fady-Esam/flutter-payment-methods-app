import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:payment_methods/Features/data/models/payment_input_model.dart';
import 'package:payment_methods/Features/data/repos/checkout_repo.dart';
import 'package:payment_methods/core/utils/stripe_service.dart';

import '../../../core/errors/failure.dart';

class CheckoutRepoImpl implements CheckoutRepo {
  final StripeService stripeService;

  CheckoutRepoImpl({required this.stripeService});
  @override
  Future<Either<Failure, void>> makePaymentProcess(
      {required PaymentInputModel paymentInputModel}) async {
    try {
      await stripeService.makePaymentProcess(
          paymentInputModel: paymentInputModel);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErro(e));
      }
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}
