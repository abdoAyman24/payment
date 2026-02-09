import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:payment/feature/payment/data/model/payment_intent_input_model.dart';
import 'package:payment/feature/payment/domain/repos/payment_repos.dart';

part 'stripe_state.dart';

class StripeCubit extends Cubit<StripeState> {
  StripeCubit(this.paymentRepos) : super(StripeInitial());
  final PaymentRepos paymentRepos;

  Future<void> makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    emit(StripeLoad());
    var result = await paymentRepos.makePayment(
      paymentIntentInputModel: paymentIntentInputModel,
    );

    result.fold((l) {
      log(l.errorMessage);
      emit(StripeFailure(errorMessage: l.errorMessage));
    }, (r) => emit(StripeSuccess()));
  }

  @override
  void onChange(Change<StripeState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
