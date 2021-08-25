import 'package:search_calculate/watchlist/data/datasources/watchlist_local_datasource.dart';
import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart';

class WatchlistRepository extends WatchlistRespoitoryContract {
  final WatchlistLocalDatasource watchlistLocalDatasource;

  WatchlistRepository(this.watchlistLocalDatasource);

  Future addToWatchlist(WatchlistItem watchlistItem) async {
    return watchlistLocalDatasource.addToWatchlist(watchlistItem);
  }

  //TODO: TEST MISSING
  Future removeFromWatchlist(WatchlistItem watchlistItem) {
    return watchlistLocalDatasource.removeFromWatchlist(watchlistItem);
  }

  Future<List<WatchlistItemModel>> getWatchlistItems() async {
    return watchlistLocalDatasource.getWatchlist();
  }
}
