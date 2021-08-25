import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/results/domain/usecases/add_to_watchlist.dart';

import '../../../_helpers/objects.dart';
import '../../../watchlist/domain/usecases/get_watchlist_test.mocks.dart';

void main() {
  late AddToWatchlist addToWatchlist;
  late MockWatchlistRespoitoryContract mockWatchlistRespoitory;

  setUp(() {
    mockWatchlistRespoitory = MockWatchlistRespoitoryContract();
    addToWatchlist = AddToWatchlist(mockWatchlistRespoitory);

    when(mockWatchlistRespoitory.addToWatchlist(tWatchlistItemModel))
        .thenAnswer((_) async => Future.value());
  });

  test('should save company on repository when called', () async {
    await addToWatchlist(tWatchlistItemModel);

    verify(mockWatchlistRespoitory.addToWatchlist(tWatchlistItemModel));
    verifyNoMoreInteractions(mockWatchlistRespoitory);
  });
}
