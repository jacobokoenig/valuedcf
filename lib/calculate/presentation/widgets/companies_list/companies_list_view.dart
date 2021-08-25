import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:search_calculate/calculate/presentation/widgets/companies_list/company_list_tile.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/calculation_flow_main.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class CompaniesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculateCubit, CalculateState>(
      builder: (context, state) {
        if (!(state is CalculateFilteredCompanies)) return Container();

        return ListView.separated(
          itemCount: state.companies.length,
          separatorBuilder: (context, index) => Divider(color: lightGray),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                push(
                  context,
                  CalculationFlowMain(
                    watchlistItem: WatchlistItem.fromCompany(state.companies[index]),
                  ),
                );
              },
              child: Padding(
                padding: Spacing.smallVerticalPadding,
                child: CompanyListTile(company: state.companies[index]),
              ),
            );
          },
        );
      },
    );
  }
}
