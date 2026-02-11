import 'package:payment/feature/payment/data/model/paypal_model/amount_model/amount_model.dart';
import 'package:payment/feature/payment/data/model/paypal_model/amount_model/details.dart';
import 'package:payment/feature/payment/data/model/paypal_model/item_list_model/item_list_model.dart';
import 'package:payment/feature/payment/data/model/paypal_model/item_list_model/order_item_model.dart';

({AmountModel amount, OrderItemListModel itemsList}) getTransactionData() {
  AmountModel amount = AmountModel(
    total: '100',
    currency: 'USD',
    details: Details(subtotal: '100', shipping: '0', shippingDiscount: 0),
  );
  List<OrderItemModel> items = [
    OrderItemModel(name: 'Apple', quantity: 4, currency: 'USD', price: '10'),
    OrderItemModel(
      name: 'Pineapple',
      quantity: 5,
      currency: 'USD',
      price: '12',
    ),
  ];
  OrderItemListModel itemListModel = OrderItemListModel(items: items);

  return (amount:amount , itemsList:itemListModel);
}