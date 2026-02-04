import 'package:flutter/material.dart';
import 'package:payment/core/widget/custom_button.dart';
import 'package:payment/feature/payment/data/model/product_List.dart';
import 'package:payment/feature/payment/data/model/produt_model.dart';
import 'package:payment/feature/payment/presentation/view/thank_view.dart';
import 'package:payment/feature/payment/presentation/view/widget/basket_view.dart';
import 'package:payment/feature/payment/presentation/view/widget/payment_method_list_view.dart';
import 'package:payment/feature/payment/presentation/view/widget/product_item_info.dart';
import 'package:payment/feature/payment/presentation/view/widget/total_info.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    List<ProductModel> products = Productlist.productList;
    var children = [
          BasketView(products: products),
          const SizedBox(height: 20),
          ProductItemInfo(
            title: 'Order Subtotal',
            value: Productlist.getTotalPrice().toString(),
          ),
          const SizedBox(height: 4),

          ProductItemInfo(
            title: 'Discount',
            value: Productlist.getDiscount().toString(),
          ),
          const SizedBox(height: 4),

          ProductItemInfo(title: 'Shipping', value: '8'),
          const SizedBox(height: 4),
          Divider(height: 34, thickness: 2, color: Color(0xffC7C7C7)),
          TotalInfo(
            title: 'Total',
            value: (Productlist.getTotalPriceAfterDiscount() - 8).toString(),
          ),
          const SizedBox(height: 8),
          CustomButton(
            text: 'Complete Paymen',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                enableDrag: true,
                backgroundColor: Colors.grey,
                barrierColor: Colors.black54, 
                builder: (context) {
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
                        CustomButton(
                          text: 'Pay',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              ThankView.routeName,
                              arguments:
                                  Productlist.getTotalPriceAfterDiscount(),
                            );
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ];
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        children: children,
      ),
    );
  }
}
