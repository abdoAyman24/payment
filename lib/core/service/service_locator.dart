import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:payment/core/service/api_service.dart';
import 'package:payment/core/service/stripe_service/stripe_service.dart';
import 'package:payment/feature/payment/data/repos/payment_repos_impl.dart';
import 'package:payment/feature/payment/domain/repos/payment_repos.dart';


final getIt = GetIt.instance;
void setUpGetIt() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(dio: getIt.get<Dio>()));
  getIt.registerSingleton<StriprService>(StriprService(apiService: getIt.get<ApiService>()));
  getIt.registerSingleton<PaymentRepos>(PaymentReposImpl(striprService: getIt.get<StriprService>()));




}
