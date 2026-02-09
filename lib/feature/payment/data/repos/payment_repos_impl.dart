import 'package:dartz/dartz.dart';
import 'package:payment/core/error/failure.dart';
import 'package:payment/core/service/stripe_service/stripe_service.dart';
import 'package:payment/feature/payment/data/model/payment_intent_input_model.dart';
import 'package:payment/feature/payment/domain/repos/payment_repos.dart';

class PaymentReposImpl extends PaymentRepos {
  final StriprService striprService;

  PaymentReposImpl({required this.striprService});
  @override
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    try {
      await striprService.makePayment(
        paymentIntentInputModel: paymentIntentInputModel,
      );
      return Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
