import 'package:flutter/material.dart';
import 'package:second/data/models/product.dart';
import 'package:second/ui/widgets/electroinc_widget.dart';
import 'package:second/ui/widgets/fashoin_widget.dart';
import 'package:second/ui/widgets/groceries_widget.dart';

class ProductsFactory extends StatelessWidget {
  const ProductsFactory({super.key, required this.product});
  final Product product;
  @override
  Widget build(BuildContext context) {
    switch (product.category) {
      case 'Electronics':
        return ElectronicsWidget(product: product);
      case 'Fashion':
        return FashionWidget(product: product);
      case 'Groceries':
        return GroceriesWidget(product: product);
      default:
        throw Exception('Unknown category: ${product.category}');
    }
  }
}
