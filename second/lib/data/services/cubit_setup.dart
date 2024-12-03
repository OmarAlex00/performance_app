import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/data/services/di.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';

class CubitSetup extends StatelessWidget {
  const CubitSetup({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              AppCubit(productsFunctions: getIt(), productsGenerator: getIt())
                ..getProducts(1),
        ),
      ],
      child: child,
    );
  }
}
