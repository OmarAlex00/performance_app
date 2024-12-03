import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:second/ui/controller/cubit/app_cubit.dart';
import 'package:second/ui/widgets/custom_button.dart';
import 'package:second/ui/widgets/cutsom_text_field.dart';

class FilterWidgets extends StatefulWidget {
  const FilterWidgets({
    super.key,
  });

  @override
  State<FilterWidgets> createState() => _FilterWidgetsState();
}

class _FilterWidgetsState extends State<FilterWidgets> {
  @override
  void dispose() {
    min.dispose();
    max.dispose();
    category.dispose();
    super.dispose();
  }

  final TextEditingController min = TextEditingController();
  final TextEditingController max = TextEditingController();
  final TextEditingController category = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: CustomTextField(
              controller: min,
              hint: 'min',
            )),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: CustomTextField(
              controller: max,
              hint: 'max',
            )),
            const SizedBox(
              width: 4,
            ),
            Expanded(
                child: CustomTextField(
              controller: category,
              hint: 'category',
            )),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          title: 'Filter',
          onTap: () {
            if (category.text.isNotEmpty &&
                min.text.isNotEmpty &&
                max.text.isNotEmpty) {
              context.read<AppCubit>().filterProducts(category.text,
                  double.parse(min.text), double.parse(max.text));
            }
          },
        ),
      ],
    );
  }
}
