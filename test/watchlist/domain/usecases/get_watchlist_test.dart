import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart';
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart';

import '../../../_helpers/objects.dart';
import 'get_watchlist_test.mocks.dart';

@GenerateMocks([WatchlistRespoitoryContract])
void main() {
  late GetWatchlist getWatchlist;
  late MockWatchlistRespoitoryContract mockWatchlistRespoitory;

  final tItems = [
    tWatchlistItemModel,
  ];

  setUp(() {
    mockWatchlistRespoitory = MockWatchlistRespoitoryContract();
    getWatchlist = GetWatchlist(mockWatchlistRespoitory);

    when(mockWatchlistRespoitory.getWatchlistItems()).thenAnswer((_) async => tItems);
  });

  test('should return watchlist when called', () async {
    List<WatchlistItem> items = await getWatchlist();

    expect(items, tItems);
    verify(mockWatchlistRespoitory.getWatchlistItems());
    verifyNoMoreInteractions(mockWatchlistRespoitory);
  });
}
