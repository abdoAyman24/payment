import 'package:flutter/material.dart';
import 'package:payment/core/utils/app_icon.dart';
import 'package:payment/feature/payment/data/model/produt_model.dart';

class BasketView extends StatelessWidget {
  const BasketView({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHight * 0.5,
      child: Stack(
        children: [
          Image.asset(Assets.imagesBasket),
          ...List.generate(products.length, (index) {
            const itemsPerColumn = 6;
    
            final columnIndex = index ~/ itemsPerColumn; // 0,1,2,3...
            final rowIndex = index % itemsPerColumn; // 0..4
    
            final top = (screenHight * 0.04) + (rowIndex * 50);
    
            final left = screenWidth * (0.1 + (columnIndex * 0.21));
    
            return Positioned(
              top: top,
              left: left,
              child: Image.asset(products[index].imagePath, width: 100),
            );
          }),
        ],
      ),
    );
  }
}


