import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/data/repos/checkout_repo_impl.dart';
import 'api_service.dart';
import 'stripe_service.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerSingleton<CheckoutRepoImpl>(CheckoutRepoImpl(
      stripeService: StripeService(apiService: ApiService(dio: Dio()))));
}
