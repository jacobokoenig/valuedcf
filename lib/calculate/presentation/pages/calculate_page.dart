import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:search_calculate/calculate/presentation/widgets/companies_list/companies_list_view.dart';
import 'package:search_calculate/calculate/presentation/widgets/header/calculate_header.dart';
import 'package:search_calculate/core/widgets/search_bar.dart';

import 'package:search_calculate/get_it.dart';

class CalculatePage extends StatefulWidget {
  @override
  _CalculatePageState createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final _calculateCubit = sl<CalculateCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _calculateCubit,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CalculateHeader(),
          Padding(
            padding: Spacing.standardPadding.copyWith(bottom: 0),
            child: SearchBar(
              onChanged: _calculateCubit.filterCompanies,
            ),
          ),
          Expanded(
            child: Padding(
              padding: Spacing.standardPadding.copyWith(top: 0, right: 0),
              child: CompaniesListView(),
            ),
          ),
        ],
      ),
    );
  }
}
