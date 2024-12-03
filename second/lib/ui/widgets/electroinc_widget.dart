import 'package:flutter/material.dart';
import 'package:second/data/models/product.dart';

class ElectronicsWidget extends StatelessWidget {
  const ElectronicsWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle:
          Text('\$${product.price.toStringAsFixed(2)}\n  ${product.rating}'),
      trailing: const Icon(Icons.electric_bolt_outlined),
    );
  }
}
