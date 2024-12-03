import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';
import 'package:second/ui/widgets/app_bloc_builder.dart';
import 'package:second/ui/widgets/custom_button.dart';
import 'package:second/ui/widgets/filter_widgets.dart';
import 'package:second/ui/widgets/sort_row.dart';

class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Product List')),
      body: Column(
        children: [
          const SortRow(),
          const FilterWidgets(),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            title: 'reset',
            onTap: () {
              context.read<AppCubit>().resetProducts();
            },
          ),
          const SizedBox(
            height: 10,
          ),
          const AppBlocBuilder(),
        ],
      ),
    );
  }
}
