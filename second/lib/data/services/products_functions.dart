import 'package:second/data/models/product.dart';

class ProductsFunctions {
  List<Product> filterProducts(List<Product> products, String category,
      double minPrice, double maxPrice) {
    return products.where((product) {
      return product.category == category &&
          product.price >= minPrice &&
          product.price <= maxPrice;
    }).toList();
  }

  List<Product> sortProducts(List<Product> products, String criteria) {
    List<Product> sortedProducts = List.from(products);
    if (criteria == 'price') {
      sortedProducts.sort((a, b) => a.price.compareTo(b.price));
    } else if (criteria == 'rating') {
      sortedProducts.sort((a, b) => b.rating.compareTo(a.rating));
    }
    return sortedProducts;
  }
}
