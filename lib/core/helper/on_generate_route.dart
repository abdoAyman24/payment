import 'package:flutter/material.dart';
import 'package:payment/feature/payment/presentation/view/cart_view.dart';
import 'package:payment/feature/payment/presentation/view/payment_details_view.dart';
import 'package:payment/feature/payment/presentation/view/thank_view.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());

    case PaymentDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            PaymentDetailsView(totalPrice: setting.arguments as double),
      );

    case ThankView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            ThankView(totalPrice: setting.arguments as double),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
