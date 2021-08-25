import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart';
import 'package:search_calculate/watchlist/presentation/cubit/watchlist_cubit.dart';

import '../../../_helpers/objects.dart';
import '../../../calculate/presentation/cubit/calculate_cubit_test.mocks.dart';
import 'watchlist_cubit_test.mocks.dart';

@GenerateMocks([GetWatchlist])
void main() {
  late WatchlistCubit cubit;
  late MockGetWatchlist mockGetWatchlist;
  late MockHomeCubit mockHomeCubit;
  late MockFilterCompanies mockFilterCompanies;

  final tWatchlist = [tWatchlistItemModel];

  final tCompanies = [
    Company(
      userCreated: true,
      name: 'foo',
      ticker: 'companyTickers',
      logo: 'logo',
      location: 'location',
      exchange: 'exchange',
      currency: 'currency',
      fcf2020: 1,
      shortTermDebt: 1,
      sharesOutstanding: 1,
      fiveYearAvgFCFGrowth: '1',
      volatilityScore: 'volatilityScore',
    ),
    Company(
      userCreated: true,
      name: 'bar',
      ticker: 'ticker',
      logo: 'logo',
      location: 'location',
      exchange: 'exchange',
      currency: 'currency',
      fcf2020: 1,
      shortTermDebt: 1,
      sharesOutstanding: 1,
      fiveYearAvgFCFGrowth: '1',
      volatilityScore: 'volatilityScore',
    ),
  ];

  final tWatchlistCompanies = [
    Company(
      userCreated: true,
      name: 'foo',
      ticker: 'companyTicker',
      logo: 'logo',
      location: 'location',
      exchange: 'exchange',
      currency: 'currency',
      fcf2020: 1,
      shortTermDebt: 1,
      sharesOutstanding: 1,
      fiveYearAvgFCFGrowth: '1',
      volatilityScore: 'volatilityScore',
    ),
  ];

  setUp(() {
    mockGetWatchlist = MockGetWatchlist();
    mockHomeCubit = MockHomeCubit();
    mockFilterCompanies = MockFilterCompanies();

    when(mockGetWatchlist()).thenAnswer((_) async => tWatchlist);
    when(mockHomeCubit.state).thenAnswer((_) => HomeLoaded(tCompanies));

    cubit = WatchlistCubit(
      mockHomeCubit,
      mockGetWatchlist,
      mockFilterCompanies,
    );
  });
  test('should emit all companies in the watchlist when cubit is initialised', () async {
    WatchlistInitial initialState = WatchlistInitial();
    WatchlistLoaded loadedState = WatchlistLoaded(tWatchlist);

    expect(cubit.state, initialState);
    expectLater(cubit.stream, emitsInOrder([loadedState]));
    await cubit.loadData();

    verify(mockGetWatchlist());
  });
}
