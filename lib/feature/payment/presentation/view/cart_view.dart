import 'package:flutter/material.dart';
import 'package:payment/core/function/build_app_bar.dart';
import 'package:payment/feature/payment/presentation/view/widget/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const String routeName = 'cartView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(tilte: 'My Cart'),
      body: CartViewBody(),
    );
  }
}
