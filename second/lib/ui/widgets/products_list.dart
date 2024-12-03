import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/data/models/product.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';
import 'package:second/ui/widgets/products_factory.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({
    super.key,
    required this.filteredProducts,
  });

  final List<Product> filteredProducts;

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  final ScrollController controller = ScrollController();
  bool isCalling = false;
  @override
  void initState() {
    int page = context.read<AppCubit>().page;
    controller.addListener(() async {
      if (controller.position.pixels >=
          controller.position.maxScrollExtent * .9) {
        if (!isCalling) {
          isCalling = true;
          await context.read<AppCubit>().getProducts(++page);

          isCalling = false;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: controller,
      itemCount: widget.filteredProducts.length,
      itemBuilder: (context, index) {
        final product = widget.filteredProducts[index];
        return ProductsFactory(product: product);
      },
    );
  }
}
