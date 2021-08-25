import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/core/widgets/search_bar.dart';
import 'package:search_calculate/core/widgets/text/title.dart';

import 'package:search_calculate/get_it.dart';
import 'package:search_calculate/watchlist/presentation/cubit/watchlist_cubit.dart';
import 'package:search_calculate/watchlist/presentation/widgets/watchlist_companies_list/watchlist_companies_list_view.dart';

class WatchlistPage extends StatefulWidget {
  @override
  _WatchlistPageState createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> {
  final _watchlistCubit = sl<WatchlistCubit>();

  @override
  void initState() {
    super.initState();
    _watchlistCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _watchlistCubit,
      child: SafeArea(
        child: Padding(
          padding: Spacing.standardPadding.copyWith(top: 0, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TitleHeading('Watchlist'),
              VerticalSpacing(),
              SearchBar(onChanged: (s) {}), //_watchlistCubit.filterCompanies),
              VerticalSpacing(),
              Expanded(child: WatchlistCompaniesListView()),
            ],
          ),
        ),
      ),
    );
  }
}
