import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/results/domain/usecases/add_to_watchlist.dart';
import 'package:search_calculate/results/domain/usecases/calculate_5_year_avg_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/calculate_year_by_year_fair_value.dart';
import 'package:search_calculate/results/domain/usecases/remove_from_watchlist.dart';
import 'package:search_calculate/results/presentation/cubit/results_cubit.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

import '../../../_helpers/objects.dart';
import '../../../watchlist/presentation/cubit/watchlist_cubit_test.mocks.dart';
import 'results_cubit_test.mocks.dart';

@GenerateMocks([
  AddToWatchlist,
  RemoveFromWatchlist,
  Calculate5YearAvgFairValue,
  CalculateYearByYearFairValue,
])
void main() {
  late ResultsCubit cubit;
  late MockAddToWatchlist mockAddToWatchlist;
  late MockGetWatchlist mockGetWatchlist;
  late MockRemoveFromWatchlist mockRemoveFromWatchlist;
  late MockCalculate5YearAvgFairValue mockCalculate5YearAvgFairValue;
  late MockCalculateYearByYearFairValue mockCalculateYearByYearFairValue;

  final tWatchlist = [tWatchlistItem];

  setUp(() {
    mockGetWatchlist = MockGetWatchlist();
    mockAddToWatchlist = MockAddToWatchlist();
    mockCalculate5YearAvgFairValue = MockCalculate5YearAvgFairValue();
    mockCalculateYearByYearFairValue = MockCalculateYearByYearFairValue();
    mockRemoveFromWatchlist = MockRemoveFromWatchlist();

    when(mockAddToWatchlist(any)).thenAnswer((_) async => Future.value());
    when(mockRemoveFromWatchlist(any)).thenAnswer((_) async => Future.value());
    when(mockGetWatchlist()).thenAnswer((_) async => tWatchlist);
    when(mockCalculateYearByYearFairValue(any)).thenAnswer((_) => 2);
    when(mockCalculate5YearAvgFairValue(any)).thenAnswer((_) => 1);

    cubit = ResultsCubit(
      mockAddToWatchlist,
      mockRemoveFromWatchlist,
      mockGetWatchlist,
      mockCalculateYearByYearFairValue,
      mockCalculate5YearAvgFairValue,
    );
  });

  test('should return year by year fair value when loaded with appropriate type', () async {
    WatchlistItem tItem = tWatchlistItem.copyWith(
      calculationData: tWatchlistItem.calculationData.copyWith(calculationType: 'yearByYear'),
    );

    ResultsInitial initialState = ResultsInitial();
    ResultsLoaded loadedState =
        ResultsLoaded(2, 2 * tWatchlistItem.calculationData.marginOfSafety! / 100);

    expect(cubit.state, initialState);
    expectLater(cubit.stream, emitsInOrder([loadedState]));
    await cubit.loadData(tItem);

    verify(mockCalculateYearByYearFairValue(tItem));
    verifyZeroInteractions(mockCalculate5YearAvgFairValue);
  });

  test('should return 5 year avg fair value when loaded with appropriate type', () async {
    WatchlistItem tItem = tWatchlistItem.copyWith(
      calculationData: tWatchlistItem.calculationData.copyWith(calculationType: 'fiveYearAvg'),
    );

    ResultsInitial initialState = ResultsInitial();
    ResultsLoaded loadedState =
        ResultsLoaded(1, 1 * tWatchlistItem.calculationData.marginOfSafety! / 100);

    expect(cubit.state, initialState);
    expectLater(cubit.stream, emitsInOrder([loadedState]));
    await cubit.loadData(tItem);

    verify(mockCalculate5YearAvgFairValue(tItem));
    verifyZeroInteractions(mockCalculateYearByYearFairValue);
  });

  test('should add to watchlist when method is called', () async {
    ResultsInitial initialState = ResultsInitial();

    WatchlistItem newWatchlistItem = WatchlistItem(
      company: tCompany,
      calculationData: CalculationData(calculationType: 'new type'),
    );

    expect(cubit.state, initialState);
    expectLater(cubit.stream, emitsInOrder([isA<ResultsLoaded>(), isA<ResultsAddedToWatchlist>()]));
    await cubit.loadData(newWatchlistItem);
    await cubit.addToWatchlist();

    verify(mockGetWatchlist());
    verify(mockAddToWatchlist(newWatchlistItem));
  });

  test('should not save to watchlist if item with same data is already saved', () async {
    ResultsInitial initialState = ResultsInitial();

    expect(cubit.state, initialState);
    expectLater(
        cubit.stream, emitsInOrder([isA<ResultsLoaded>(), isA<ResultsAlreadyExistsOnWatchlist>()]));
    await cubit.loadData(tWatchlistItem);
    await cubit.addToWatchlist();

    verify(mockGetWatchlist());
  });

  test('should update item if other item with same uuid but different data exists', () async {
    ResultsInitial initialState = ResultsInitial();

    WatchlistItem watchlistItemToUpdate = WatchlistItem(
      uuid: tWatchlistItem.uuid,
      company: tCompany,
      calculationData: CalculationData(calculationType: 'new type'),
    );

    expect(cubit.state, initialState);
    expectLater(cubit.stream, emitsInOrder([isA<ResultsLoaded>(), isA<ResultsAddedToWatchlist>()]));
    await cubit.loadData(watchlistItemToUpdate);
    await cubit.addToWatchlist();

    verify(mockGetWatchlist());
    verify(mockRemoveFromWatchlist(watchlistItemToUpdate));
    verify(mockAddToWatchlist(watchlistItemToUpdate));
  });
}
