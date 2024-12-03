import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';
import 'package:second/ui/widgets/products_list.dart';

class AppBlocBuilder extends StatelessWidget {
  const AppBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      buildWhen: (previous, current) {
        if (current is AppLoadingPagination) {
          return false;
        }
        return true;
      },
      builder: (context, state) {
        if (state is AppLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.black,
          ));
        } else if (state is AppError) {
          return Center(child: Text(state.message));
        } else if (state is AppLoaded) {
          final filteredProducts = state.products;
          return Expanded(
            child: ProductsList(filteredProducts: filteredProducts),
          );
        } else {
          return const Center(child: Text('No Data'));
        }
      },
    );
  }
}
