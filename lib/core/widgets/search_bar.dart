import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';

class SearchBar extends StatelessWidget {
  final Function(String)? onChanged;
  final TextEditingController _controller = TextEditingController();

  SearchBar({Key? key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      controller: _controller,
      onChanged: onChanged,
      backgroundColor: extraLightGray,
      placeholder: 'Search',
      textAlign: TextAlign.start,
      keyboardType: TextInputType.text,
      prefix: Icon(
        Icons.search,
        color: gray,
      ),
      suffixIcon: IconButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          _controller.clear();
          BlocProvider.of<CalculateCubit>(context).filterCompanies('');
        },
        icon: Icon(
          Icons.clear,
          color: gray,
        ),
      ),
    );
  }
}
