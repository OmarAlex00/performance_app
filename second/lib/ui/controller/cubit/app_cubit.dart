import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:second/data/models/product.dart';
import 'package:second/data/services/products_functions.dart';
import 'package:second/data/services/products_generator.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({required this.productsFunctions, required this.productsGenerator})
      : super(AppInitial());

  final ProductsFunctions productsFunctions;
  final ProductsGenerator productsGenerator;
  int page = 1;
  List<Product> products = [];
  List<Product> filteredProducts = [];
  Future<void> getProducts(int page) async {
    try {
      if (page == 1) {
        emit(AppLoading());
      } else {
        emit(AppLoadingPagination());
      }
      List<Product> products = await compute(
        productsGenerator.generateProducts,
        page,
      );
      if (products.isEmpty) {
        emit(AppEmpty());
      } else {
        if (page == 1) {
          this.products = products;
        } else {
          this.products.addAll(products);
        }

        emit(AppLoaded(products: this.products));
      }
    } on Exception catch (e) {
      emit(AppError(message: e.toString()));
    }
  }

  void resetProducts() async {
    page = 1;
    await getProducts(page);
  }

  void filterProducts(String category, double minPrice, double maxPrice) async {
    emit(AppLoading());
    filteredProducts = products;
    filteredProducts = productsFunctions.filterProducts(
        products, category, minPrice, maxPrice);
    if (filteredProducts.isEmpty) {
      emit(AppEmpty());
    } else {
      emit(AppLoaded(products: filteredProducts));
    }
  }

  void sortProducts(String criteria) async {
    emit(AppLoading());
    filteredProducts = products;

    filteredProducts =
        productsFunctions.sortProducts(filteredProducts, criteria);
    if (filteredProducts.isEmpty) {
      emit(AppEmpty());
    } else {
      emit(AppLoaded(products: filteredProducts));
    }
  }
}
