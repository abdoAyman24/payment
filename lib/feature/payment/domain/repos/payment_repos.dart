import 'package:dartz/dartz.dart';
import 'package:payment/core/error/failure.dart';
import 'package:payment/feature/payment/data/model/payment_intent_input_model.dart';

abstract class PaymentRepos {
  Future<Either<Failure, void>> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  });
}
