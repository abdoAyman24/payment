import 'package:flutter/material.dart';
import 'package:payment/feature/payment/presentation/view/widget/custom_buttom_bloc_consumer.dart';
import 'package:payment/feature/payment/presentation/view/widget/payment_method_list_view.dart';

class CustomButtomSheet extends StatelessWidget {
  const CustomButtomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25,
        vertical: 30,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(),
          const SizedBox(height: 20),
          CustomButtomBlocConsumer(),
        ],
      ),
    );
  }
}

