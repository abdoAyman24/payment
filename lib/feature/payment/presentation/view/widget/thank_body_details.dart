import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:payment/core/utils/app_text_styles.dart';
import 'package:payment/feature/payment/presentation/view/widget/master_card_widget.dart';
import 'package:payment/feature/payment/presentation/view/widget/payment_item_info.dart';
import 'package:payment/feature/payment/presentation/view/widget/total_info.dart';

class TahnkViewbodyDetails extends StatelessWidget {
  const TahnkViewbodyDetails({super.key, required this.totalPrice});

  final double totalPrice;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50),
        Text('Thank you!', style: AppText.medium25),
        Text('Your transaction was successful', style: AppText.regular18),
        const SizedBox(height: 40),
        PaymentItemInfo(title: 'Date', value: '01/24/2023'),
        const SizedBox(height: 8),

        PaymentItemInfo(title: 'Time', value: '10:15 AM'),
        const SizedBox(height: 8),

        PaymentItemInfo(title: 'To', value: 'Sam Louis'),
        Divider(color: Color(0xffC7C7C7), height: 60.h),

        TotalInfo(title: 'Total', value: '$totalPrice'),
        const SizedBox(height: 24),

        MasterCardWidget(),
      ],
    );
  }
}
