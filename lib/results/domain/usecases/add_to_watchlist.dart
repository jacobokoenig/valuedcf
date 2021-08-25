import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart';
import 'package:search_calculate/watchlist/presentation/cubit/watchlist_cubit.dart';

class AddToWatchlist {
  final WatchlistRespoitoryContract watchlistRepositoryContract;

  AddToWatchlist(this.watchlistRepositoryContract);

  Future call(WatchlistItem watchlistItem) async {
    return watchlistRepositoryContract.addToWatchlist(watchlistItem);
  }
}
