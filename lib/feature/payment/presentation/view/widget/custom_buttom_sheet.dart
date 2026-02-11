import 'package:flutter/material.dart';
import 'package:payment/feature/payment/presentation/view/widget/custom_buttom_bloc_consumer.dart';
import 'package:payment/feature/payment/presentation/view/widget/payment_method_list_view.dart';

class CustomButtomSheet extends StatefulWidget {
  const CustomButtomSheet({super.key});

  @override
  State<CustomButtomSheet> createState() => _CustomButtomSheetState();
}

bool isPaypal = false;

class _CustomButtomSheetState extends State<CustomButtomSheet> {
 void changePaymentMethod({required int index}) {
    if (index == 0) {
      isPaypal = false;
    } else {
      isPaypal = true;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PaymentMethodListView(chnagePaymentMethod: changePaymentMethod,),
          const SizedBox(height: 20),
          CustomButtomBlocConsumer(isPaypal: isPaypal),
        ],
      ),
    );
  }
}
