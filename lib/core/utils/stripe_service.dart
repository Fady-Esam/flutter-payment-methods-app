import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_methods/Features/data/models/payment_input_model.dart';
import 'package:payment_methods/core/utils/api_service.dart';

import '../../Features/data/models/payment_intent_model/payment_intent_model.dart';
import 'secret_keys.dart';

class StripeService {
  final ApiService apiService;

  StripeService({required this.apiService});
  Future<PaymentIntentModel> paymentIntent(
      {required PaymentInputModel paymentInputModel}) async {
    var res = await apiService.post(
      body: paymentInputModel.toJson(),
      endPoint: 'payment_intents',
      token: SecretKeys.token,
      contentType: Headers.formUrlEncodedContentType,
    );
    return PaymentIntentModel.fromJson(res.data);
  }

  Future<String> getEphemeralKey({required String cusomerId}) async {
    var res = await apiService.post(
        body: {'customer': cusomerId},
        endPoint: 'ephemeral_keys',
        token: SecretKeys.token,
        contentType: Headers.formUrlEncodedContentType,
        headers: {
          'Authorization':
              'Bearer  ${SecretKeys.token}',
          'Stripe-Version': '2023-08-16',
        });
    return res.data['secret'];
  }

  Future<void> initPaymentSheet({
    required PaymentIntentModel paymentIntentModel,
    required String ephemeralKey,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: paymentIntentModel.clientSecret,
        customerId: 'cus_PoLE35aaI0mQ39',
        customerEphemeralKeySecret: ephemeralKey
          ,
      ),
    );
  }

  Future<void> displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future<void> makePaymentProcess(
      {required PaymentInputModel paymentInputModel}) async {
    var paymentInputModelResult =
        await paymentIntent(paymentInputModel: paymentInputModel);
    String ephemeralKey =
        await getEphemeralKey(cusomerId: paymentInputModel.customerId);
    await initPaymentSheet(
        paymentIntentModel: paymentInputModelResult,
        ephemeralKey: ephemeralKey);
    await displayPaymentSheet();
  }
}
