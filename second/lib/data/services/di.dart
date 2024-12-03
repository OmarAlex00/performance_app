import 'package:get_it/get_it.dart';
import 'package:second/data/services/products_functions.dart';
import 'package:second/data/services/products_generator.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<ProductsFunctions>(() => ProductsFunctions());
  getIt.registerLazySingleton<ProductsGenerator>(() => ProductsGenerator());
}
