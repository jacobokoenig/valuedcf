import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import '../../../_helpers/fixture_reader.dart';
import '../../../_helpers/objects.dart';

void main() {
  late String watchlistJson;

  setUp(() {
    watchlistJson = fixture('watchlist_item.json');
  });

  test('should return model from JSON', () {
    WatchlistItemModel result = WatchlistItemModel.fromJson(watchlistJson);
    expect(result, tWatchlistItemModel);
  });
}
