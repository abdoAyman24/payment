import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/function/error_bar.dart';
import 'package:payment/core/function/get_transaction_data.dart';
import 'package:payment/core/service/payment_api_key.dart';
import 'package:payment/core/widget/custom_button.dart';
import 'package:payment/feature/payment/data/model/product_List.dart';
import 'package:payment/feature/payment/data/model/stripe_model/payment_intent_input_model.dart';
import 'package:payment/feature/payment/presentation/manager/stripe_cubit/stripe_cubit.dart';
import 'package:payment/feature/payment/presentation/view/thank_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({super.key, required this.isPaypal});
  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StripeCubit, StripeState>(
      listener: (context, state) {
        if (state is StripeSuccess) {
          Navigator.pushReplacementNamed(
            context,
            ThankView.routeName,
            arguments: Productlist.getTotalPriceAfterDiscount(),
          );
        }
        if (state is StripeFailure) {
          Navigator.pop(context);
          buildErrorBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Pay',
          onTap: () {
            if (isPaypal) {
              excutePaypalPayment(context);
            } else {
              excuteStripePayment(context);
            }
          },
          isLoading: state is StripeLoad,
        );
      },
    );
  }

  void excuteStripePayment(BuildContext context) {
    BlocProvider.of<StripeCubit>(context).makePayment(
      paymentIntentInputModel: PaymentIntentInputModel(
        amount: Productlist.getTotalPriceAfterDiscount(),
        currency: 'USD',
        customerId: 'cus_TwK3K9lUpPyURY',
      ),
    );
  }

  void excutePaypalPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: PaymentApiKey.paypalclientId,
          secretKey: PaymentApiKey.paypalSecretKey,
          transactions: [
            {
              "amount": getTransactionData().amount.toJson(),
              "description": "The payment transaction description.",

              "item_list": getTransactionData().itemsList.toJson(),
            },
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pushNamedAndRemoveUntil(context, ThankView.routeName, (
              route,
            ) {
              log(route.toString());
              // To remove all screen under thank you screen except main
              if (route.settings.name == '/') {
                return true;
              } else {
                return false;
              }
            });
          },
          onError: (error) {
            log("onError: $error");
            buildErrorBar(context,error.toString());
            Navigator.pop(context);
            Navigator.pop(context);

          },
          onCancel: () {
            log('cancelled:');
             buildErrorBar(context,'Transaction Cancelled');
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
