import 'package:flutter/material.dart';
import 'package:payment/core/function/build_app_bar.dart';
import 'package:payment/feature/payment/presentation/view/widget/payment_details_view_body.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key, required this.totalPrice});
  final double totalPrice;
  static const String routeName = 'paymentDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'Payment Details'),
      body: PaymentDetailsViewBody(),
    );
  }
}
