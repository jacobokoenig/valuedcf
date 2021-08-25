import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/results/presentation/pages/results_page.dart';
import 'package:search_calculate/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:search_calculate/watchlist/presentation/widgets/watchlist_companies_list/watchlist_company_list_tile.dart';

class WatchlistCompaniesListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchlistCubit, WatchlistState>(
      builder: (context, state) {
        if (!(state is WatchlistLoaded)) return Container();

        return ListView.separated(
          itemCount: state.watchlistItems.length,
          separatorBuilder: (context, index) => Divider(color: lightGray),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                push(context, ResultsPage(watchlistItem: state.watchlistItems[index]));
              },
              child: Padding(
                padding: Spacing.smallVerticalPadding,
                child: WatchlistCompanyListTile(watchlistItem: state.watchlistItems[index]),
              ),
            );
          },
        );
      },
    );
  }
}
