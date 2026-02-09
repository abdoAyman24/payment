import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment/core/widget/custom_button.dart';
import 'package:payment/feature/payment/data/model/payment_intent_input_model.dart';
import 'package:payment/feature/payment/data/model/product_List.dart';
import 'package:payment/feature/payment/presentation/manager/stripe_cubit/stripe_cubit.dart';
import 'package:payment/feature/payment/presentation/view/thank_view.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

class CustomButtomBlocConsumer extends StatelessWidget {
  const CustomButtomBlocConsumer({super.key});

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
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
        }
      },
      builder: (context, state) {
        return CustomButton(
          text: 'Pay',
          onTap: () {
            BlocProvider.of<StripeCubit>(context).makePayment(
              paymentIntentInputModel: PaymentIntentInputModel(
                amount: Productlist.getTotalPriceAfterDiscount(),
                currency: 'USD',
                customerId:'cus_TwK3K9lUpPyURY',
              ),
            );

           

          },
          isLoading: state is StripeLoad,
        );
      },
    );
  }
}
