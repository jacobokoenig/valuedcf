import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

abstract class WatchlistRespoitoryContract {
  Future addToWatchlist(WatchlistItem watchlistItem);
  Future removeFromWatchlist(WatchlistItem watchlistItem);
  Future<List<WatchlistItem>> getWatchlistItems();
}
