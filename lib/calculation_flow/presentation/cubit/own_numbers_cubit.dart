import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

part 'own_numbers_state.dart';

class OwnNumbersCubit extends Cubit<OwnNumbersState> {
  OwnNumbersCubit()
      : super(
          OwnNumbersLoaded(
            WatchlistItem(
              company: Company.empty(),
              calculationData: CalculationData(),
            ),
          ),
        );

  updateItem(WatchlistItem watchlistItem) {
    emit(OwnNumbersLoaded(watchlistItem));
  }
}
