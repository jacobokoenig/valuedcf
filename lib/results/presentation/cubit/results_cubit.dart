import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/results/domain/usecases/add_to_watchlist.dart';
import 'package:search_calculate/results/domain/usecases/calculate_5_year_avg_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/calculate_year_by_year_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/remove_from_watchlist.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart';

part 'results_state.dart';

class ResultsCubit extends Cubit<ResultsState> {
  final AddToWatchlist _addToWatchlist;
  final RemoveFromWatchlist _removeFromWatchlist;
  final GetWatchlist _getWatchlist;
  final CalculateYearByYearFairValue _calculateYearByYearFairValue;
  final Calculate5YearAvgFairValue _calculate5yearAvgFairValue;

  late WatchlistItem watchlistItem;

  ResultsCubit(
    this._addToWatchlist,
    this._removeFromWatchlist,
    this._getWatchlist,
    this._calculateYearByYearFairValue,
    this._calculate5yearAvgFairValue,
  ) : super(ResultsInitial());

  loadData(WatchlistItem watchlistItem) {
    this.watchlistItem = watchlistItem;

    String type = watchlistItem.calculationData.calculationType;

    double fairValue = 0;
    if (type == 'fiveYearAvg') {
      fairValue = _calculate5yearAvgFairValue(watchlistItem);
    } else {
      fairValue = _calculateYearByYearFairValue(watchlistItem);
    }

    double marginOfSafety = (watchlistItem.calculationData.marginOfSafety ?? 100) / 100;

    double fairValueWithMOS = fairValue * (1 - marginOfSafety);

    emit(ResultsLoaded(fairValue, fairValueWithMOS));
  }

  addToWatchlist() async {
    var state = this.state;
    if (state is ResultsInitial) return;
    List<WatchlistItem> watchlist = await _getWatchlist();

    if (watchlist.contains(watchlistItem)) {
      emit(
        ResultsAlreadyExistsOnWatchlist(
          key: GlobalKey(),
          fairValue: state.fairValue!,
          fairValueWithMOS: state.fairValueWithMOS!,
        ),
      );
    } else if (watchlist.map((e) => e.uuid).contains(watchlistItem.uuid)) {
      await _removeFromWatchlist(watchlistItem);
      await _addToWatchlist(watchlistItem);
      emit(
        ResultsAddedToWatchlist(
          key: GlobalKey(),
          fairValue: state.fairValue!,
          fairValueWithMOS: state.fairValueWithMOS!,
        ),
      );
    } else {
      await _addToWatchlist(watchlistItem);
      emit(
        ResultsAddedToWatchlist(
          key: GlobalKey(),
          fairValue: state.fairValue!,
          fairValueWithMOS: state.fairValueWithMOS!,
        ),
      );
    }
  }
}
