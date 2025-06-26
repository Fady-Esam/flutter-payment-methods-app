import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';
import '../models/payment_input_model.dart';

abstract class CheckoutRepo {
  Future<Either<Failure ,void>> makePaymentProcess(
      {required PaymentInputModel paymentInputModel});
}

