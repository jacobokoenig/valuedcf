import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart';

class GetWatchlist {
  final WatchlistRespoitoryContract watchlistRespoitoryContract;

  GetWatchlist(this.watchlistRespoitoryContract);

  Future<List<WatchlistItem>> call() async {
    return watchlistRespoitoryContract.getWatchlistItems();
  }
}
