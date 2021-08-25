import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_calculate/calculate/domain/usecases/filter_companies.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart';

part 'watchlist_state.dart';

class WatchlistCubit extends Cubit<WatchlistState> {
  final HomeCubit _homeCubit;
  final GetWatchlist _getWatchlist;
  final FilterCompanies _filterCompanies;

  late List<Company> watchlistCompanies;

  WatchlistCubit(
    this._homeCubit,
    this._getWatchlist,
    this._filterCompanies,
  ) : super(WatchlistInitial());

  loadData() async {
    List<WatchlistItem> watchlist = await _getWatchlist();
    emit(WatchlistLoaded(watchlist));
  }
}
