import 'package:flutter/material.dart';
import 'package:second/data/models/product.dart';

class GroceriesWidget extends StatelessWidget {
  const GroceriesWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle:
          Text('\$${product.price.toStringAsFixed(2)}\n  ${product.rating}'),
      trailing: CircleAvatar(
        backgroundColor: product.isAvailable ? Colors.green : Colors.red,
        radius: 30,
        child: const Center(
            child: Icon(Icons.shopping_cart, color: Colors.white, size: 30)),
      ),
    );
  }
}
