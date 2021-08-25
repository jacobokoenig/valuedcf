import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/calculation_flow_main.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/own_numbers_page.dart';
import 'package:search_calculate/core/widgets/buttons/custom_bordered_button.dart';
import 'package:search_calculate/results/presentation/cubit/results_cubit.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class ResultsButtons extends StatelessWidget {
  final WatchlistItem watchlistItem;

  const ResultsButtons(this.watchlistItem, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResultsCubit, ResultsState>(
      builder: (context, state) {
        if (state is ResultsInitial) return Container();

        return Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomBorderedButton(
                  title: 'Edit',
                  icon: Image.asset(
                    'assets/icons/edit_icon.png',
                    width: 16,
                    height: 16,
                  ),
                  onPressed: () {
                    push(
                      context,
                      watchlistItem.company.userCreated
                          ? OwnNumbersPage()
                          : CalculationFlowMain(watchlistItem: watchlistItem),
                    );
                  },
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomBorderedButton(
                  title: 'Add to Watchlist',
                  icon: Image.asset(
                    'assets/icons/bookmark_icon.png',
                    width: 16,
                    height: 16,
                  ),
                  onPressed: () {
                    BlocProvider.of<ResultsCubit>(context).addToWatchlist();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
