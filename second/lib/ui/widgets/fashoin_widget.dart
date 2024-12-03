import 'package:flutter/material.dart';
import 'package:second/data/models/product.dart';

class FashionWidget extends StatelessWidget {
  const FashionWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle:
          Text('\$${product.price.toStringAsFixed(2)}\n  ${product.rating}'),
      trailing: CircleAvatar(
        backgroundColor: Colors.amberAccent,
        radius: 30,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(product.rating.toString(),
                  style: const TextStyle(fontSize: 20, color: Colors.white)),
              const Icon(Icons.star, color: Colors.white),
            ],
          ),
        ),
      ),
    );
  }
}
