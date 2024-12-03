import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';
import 'package:second/ui/widgets/custom_button.dart';

class SortRow extends StatelessWidget {
  const SortRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomButton(
          title: 'Sort by price',
          onTap: () {
            context.read<AppCubit>().sortProducts('price');
          },
        ),
        CustomButton(
          title: 'Sort by rating',
          onTap: () {
            context.read<AppCubit>().sortProducts('rating');
          },
        ),
      ],
    );
  }
}
