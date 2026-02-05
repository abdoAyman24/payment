import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/service/api_key.dart';
import 'package:payment/core/service/api_service.dart';
import 'package:payment/feature/payment/data/model/payment_intent_input_model.dart';
import 'package:payment/feature/payment/data/model/payment_intent_model/payment_intent_model.dart';

class StriprService {
  final ApiService apiService;

  StriprService({required this.apiService});
  //1- paymentIntenetObject createPaymentIntent(amount,currency)
  //2- initPaymentSheet(paymentIntentModel)
  //3- presentPaymentSheet

  //////1- paymentIntenetObject createPaymentIntent(amount,currency)///////////////
  Future<PaymentIntentModel> createPaymentIntent({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    var response = await apiService.post(
      url: 'https://api.stripe.com/v1/payment_intents',
      body: paymentIntentInputModel.toJson(),
      token: ApiKey.stripeSecretKey,
    );
    PaymentIntentModel paymentIntentModel = PaymentIntentModel.fromJson(
      response.data,
    );
    return paymentIntentModel;
  }

  ///////////  2- initPaymentSheet(paymentIntentModel) ////////////////////
  Future initPaymentSheet({required String paymentIntentClientSecret}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Main params
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: 'Flutter Stripe Abdelftah',
      ),
    );
  }

  /////////  3- presentPaymentSheet/////////////
  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }
// this Method to make a all payment Flow in the UP
  Future makePayment({
    required PaymentIntentInputModel paymentIntentInputModel,
  }) async {
    PaymentIntentModel paymentIntentModel = await createPaymentIntent(
      paymentIntentInputModel: paymentIntentInputModel,
    );
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
    );
    await displayPaymentSheet();
  }
}
