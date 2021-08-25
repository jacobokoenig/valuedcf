import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/core/widgets/buttons/custom_back_button.dart';

import 'package:search_calculate/get_it.dart';
import 'package:search_calculate/home/presentation/pages/home_page.dart';
import 'package:search_calculate/results/presentation/cubit/results_cubit.dart';
import 'package:search_calculate/core/widgets/company_logo_name.dart';
import 'package:search_calculate/results/presentation/widgets/result_tile.dart';
import 'package:search_calculate/results/presentation/widgets/results_buttons.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class ResultsPage extends StatefulWidget {
  final WatchlistItem watchlistItem;

  const ResultsPage({Key? key, required this.watchlistItem}) : super(key: key);

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final _resultsCubit = sl<ResultsCubit>();

  @override
  void initState() {
    _resultsCubit.loadData(widget.watchlistItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => _resultsCubit,
        child: BlocConsumer<ResultsCubit, ResultsState>(
          listener: (context, state) {
            if (state is ResultsAddedToWatchlist) {
              final snackBar = SnackBar(content: Text('Company added to watchlist'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            if (state is ResultsAlreadyExistsOnWatchlist) {
              final snackBar = SnackBar(content: Text('This company is already on your watchlist'));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is ResultsInitial) return Container();
            return SafeArea(
              child: Padding(
                padding: Spacing.standardPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomBackButton(
                        onPressed: () => pushAndRemoveStack(context, HomePage()),
                      ),
                    ),
                    VerticalSpacing(),
                    CompanyLogoName(
                      name: widget.watchlistItem.company.name,
                      logoFilename: widget.watchlistItem.company.logo,
                    ),
                    VerticalSpacing(80),
                    ResultTile(
                      caption: 'Fair Value',
                      result:
                          '${widget.watchlistItem.company.currency} ${state.fairValue!.toStringAsFixed(2)}',
                    ),
                    VerticalSpacing(),
                    ResultTile(
                      caption: 'Fair Value with Margin of Safety\n(Price Target)',
                      result:
                          '${widget.watchlistItem.company.currency} ${state.fairValueWithMOS!.toStringAsFixed(2)}',
                    ),
                    ExpandedContainer(),
                    ResultsButtons(widget.watchlistItem),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
