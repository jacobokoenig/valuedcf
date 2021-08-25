import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

String watchlistKey = 'watchlist_all';

class WatchlistLocalDatasource {
  final SharedPreferences sharedPreferences;
  WatchlistLocalDatasource(this.sharedPreferences);

  List<WatchlistItemModel> getWatchlist() {
    List<String>? watchlistData = sharedPreferences.getStringList(watchlistKey);
    if (watchlistData == null) return [];
    return watchlistData.map((e) => WatchlistItemModel.fromJson(e)).toList();
  }

  removeFromWatchlist(WatchlistItem newItem) {
    List<WatchlistItem> watchlistItems = getWatchlist();

    List<String> watchlistData =
        watchlistItems.where((e) => e.uuid != newItem.uuid).map((e) => e.toJson()).toList();

    sharedPreferences.setStringList(watchlistKey, watchlistData);
  }

  addToWatchlist(WatchlistItem newItem) {
    List<WatchlistItem> watchlistItems = getWatchlist();

    if (watchlistItems.contains(newItem)) return;

    List<String> watchlistData = watchlistItems.map((e) => e.toJson()).toList();

    watchlistData.insert(0, newItem.toJson());

    sharedPreferences.setStringList(watchlistKey, watchlistData);
  }
}
