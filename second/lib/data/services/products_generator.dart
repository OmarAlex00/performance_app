import 'package:second/data/models/product.dart';

class ProductsGenerator {
  Future<List<Product>> generateProducts(int? page) async {
    print(page);
    return List.generate(10, (index) {
      index = index + (page! - 1) * 10;
      return Product(
        id: 'id_$index',
        name: 'Product $index',
        category: index % 3 == 0
            ? 'Electronics'
            : (index % 3 == 1 ? 'Fashion' : 'Groceries'),
        price: (index % 100) * 10.0,
        rating: (index % 5) + 1.0,
        isAvailable: index % 2 == 0,
      );
    });
  }
}
