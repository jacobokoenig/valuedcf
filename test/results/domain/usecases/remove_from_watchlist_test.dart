import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/results/domain/usecases/remove_from_watchlist.dart';

import '../../../_helpers/objects.dart';
import '../../../watchlist/domain/usecases/get_watchlist_test.mocks.dart';

void main() {
  late RemoveFromWatchlist removeFromWatchlist;
  late MockWatchlistRespoitoryContract mockWatchlistRespoitory;

  setUp(() {
    mockWatchlistRespoitory = MockWatchlistRespoitoryContract();
    removeFromWatchlist = RemoveFromWatchlist(mockWatchlistRespoitory);

    when(mockWatchlistRespoitory.addToWatchlist(tWatchlistItemModel))
        .thenAnswer((_) async => Future.value());
    when(mockWatchlistRespoitory.removeFromWatchlist(tWatchlistItemModel))
        .thenAnswer((_) async => Future.value());
  });

  test('should save company on repository when called', () async {
    await removeFromWatchlist(tWatchlistItemModel);

    verify(mockWatchlistRespoitory.removeFromWatchlist(tWatchlistItemModel));
    verifyNoMoreInteractions(mockWatchlistRespoitory);
  });
}
