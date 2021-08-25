import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/watchlist/data/datasources/watchlist_local_datasource.dart';
import 'package:search_calculate/watchlist/data/models/calculation_data_model.dart';
import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../_helpers/fixture_reader.dart';
import '../../../_helpers/objects.dart';
import 'watchlist_local_datasource_test.mocks.dart';

//TODO: Test with real Shared Preferences
@GenerateMocks([SharedPreferences])
void main() {
  late WatchlistLocalDatasource watchlistLocalDatasource;
  late MockSharedPreferences mockSharedPreferences;

  final List<String> initialWatchlist = [
    fixture('watchlist_item.json'),
    fixture('watchlist_item2.json'),
  ];
  final List<WatchlistItemModel> tWatchlistItems = [
    WatchlistItemModel.fromJson(fixture('watchlist_item.json')),
    WatchlistItemModel.fromJson(fixture('watchlist_item2.json')),
  ];

  setUp(() {
    mockSharedPreferences = MockSharedPreferences();
    watchlistLocalDatasource = WatchlistLocalDatasource(mockSharedPreferences);
  });

  test('should return list of items when getWatchlist is called and items exist in SP', () {
    when(mockSharedPreferences.getStringList(watchlistKey)).thenAnswer((_) => initialWatchlist);
    List<WatchlistItemModel> result = watchlistLocalDatasource.getWatchlist();
    expect(result, tWatchlistItems);
    verify(mockSharedPreferences.getStringList(watchlistKey));
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  test('should return empty list when getWatchlist is called and items dont exist in SP', () {
    when(mockSharedPreferences.getStringList(watchlistKey)).thenAnswer((_) => null);
    List<WatchlistItemModel> result = watchlistLocalDatasource.getWatchlist();
    expect(result, []);
    verify(mockSharedPreferences.getStringList(watchlistKey));
    verifyNoMoreInteractions(mockSharedPreferences);
  });

  _testAddToWatchlist(
      Map<String, Object> initialValues, WatchlistItemModel itemToAdd, dynamic expectation) async {
    SharedPreferences.setMockInitialValues(initialValues);

    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    watchlistLocalDatasource = WatchlistLocalDatasource(sharedPreferences);

    await watchlistLocalDatasource.addToWatchlist(itemToAdd);

    List<WatchlistItemModel> result = watchlistLocalDatasource.getWatchlist();

    expect(result, expectation);
  }

  group('should add item to watchlist', () {
    WatchlistItemModel tNewItem = WatchlistItemModel(
      company: tCompanyModel,
      calculationData: CalculationDataModel(
        calculationType: 'fiveYearAvg',
        requiredRateOfReturn: 0.11,
        terminalGrowthRate: 0.22,
        includeCOHAndSTD: false,
        marginOfSafety: 0.44,
        numberOfYears: 55,
        percentages: {
          'a': 0.66,
          'b': null,
        },
      ),
    );

    test('when addToWatchlist is called with existing items', () async {
      _testAddToWatchlist(
        {
          watchlistKey: [
            fixture('watchlist_item.json'),
            fixture('watchlist_item2.json'),
          ]
        },
        tNewItem,
        [
          tNewItem,
          ...tWatchlistItems,
        ],
      );
    });

    test('when addToWatchlist is called without existing items', () async {
      _testAddToWatchlist({}, tNewItem, [tNewItem]);
    });
  });

  test('should not add item to watchlist when addToWatchlist is called with a repeated item',
      () async {
    String tFixture = fixture('watchlist_item.json');
    WatchlistItemModel tExistingItem = WatchlistItemModel.fromJson(tFixture);

    _testAddToWatchlist(
      {
        watchlistKey: [tFixture]
      },
      tExistingItem,
      [tExistingItem],
    );
  });

  test('should remove item from watchlist when removeFromWatchlist is called', () async {
    when(mockSharedPreferences.getStringList(watchlistKey)).thenAnswer((_) => initialWatchlist);
    when(mockSharedPreferences.setStringList(any, any)).thenAnswer((_) => Future.value(true));

    String tFixture = fixture('watchlist_item.json');
    String tFixture2 = fixture('watchlist_item2.json');
    WatchlistItemModel tRemainingItem = WatchlistItemModel.fromJson(tFixture);
    WatchlistItemModel tItemToDelete = WatchlistItemModel.fromJson(tFixture2);

    watchlistLocalDatasource.removeFromWatchlist(tItemToDelete);

    verify(mockSharedPreferences.setStringList(watchlistKey, [tRemainingItem.toJson()]));
  });
}
