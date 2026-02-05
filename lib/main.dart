import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment/core/helper/on_generate_route.dart';
import 'package:payment/core/service/api_key.dart';
import 'package:payment/core/service/service_locator.dart';
import 'package:payment/core/utils/app_color.dart';
import 'package:payment/feature/payment/presentation/view/cart_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();
  Stripe.publishableKey = ApiKey.stripePublishKey;
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: AppColor.white,
          appBarTheme: AppBarTheme(backgroundColor: AppColor.white),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: CartView.routeName,
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}
