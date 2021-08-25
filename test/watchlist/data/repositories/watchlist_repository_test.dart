import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/watchlist/data/datasources/watchlist_local_datasource.dart';
import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import 'package:search_calculate/watchlist/data/repositories/watchlist_repository.dart';

import '../../../_helpers/objects.dart';
import 'watchlist_repository_test.mocks.dart';

@GenerateMocks([WatchlistLocalDatasource])
void main() {
  late WatchlistRepository repository;
  late MockWatchlistLocalDatasource mockWatchlistLocalDatasource;

  setUp(() {
    mockWatchlistLocalDatasource = MockWatchlistLocalDatasource();
    repository = WatchlistRepository(mockWatchlistLocalDatasource);
  });

  final tWatchlist = [tWatchlistItemModel];

  test('should return watchlist from local datasource', () async {
    when(mockWatchlistLocalDatasource.getWatchlist()).thenAnswer((_) => tWatchlist);

    List<WatchlistItemModel> result = await repository.getWatchlistItems();

    expect(result, tWatchlist);
    verify(mockWatchlistLocalDatasource.getWatchlist());
    verifyNoMoreInteractions(mockWatchlistLocalDatasource);
  });

  test('should add watchlist item when method is called', () async {
    when(mockWatchlistLocalDatasource.addToWatchlist(any)).thenAnswer((_) => Future.value());
    await repository.addToWatchlist(tWatchlistItemModel);
    verify(mockWatchlistLocalDatasource.addToWatchlist(any));
    verifyNoMoreInteractions(mockWatchlistLocalDatasource);
  });

  test('should remove watchlist item when method is called', () async {
    when(mockWatchlistLocalDatasource.removeFromWatchlist(tWatchlistItemModel))
        .thenAnswer((_) => Future.value());
    await repository.removeFromWatchlist(tWatchlistItemModel);
    verify(mockWatchlistLocalDatasource.removeFromWatchlist(tWatchlistItemModel));
    verifyNoMoreInteractions(mockWatchlistLocalDatasource);
  });
}
