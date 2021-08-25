import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart';

class RemoveFromWatchlist {
  final WatchlistRespoitoryContract watchlistRepositoryContract;

  RemoveFromWatchlist(this.watchlistRepositoryContract);

  Future call(WatchlistItem watchlistItem) async {
    return watchlistRepositoryContract.removeFromWatchlist(watchlistItem);
  }
}
