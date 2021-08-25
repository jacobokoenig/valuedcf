import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/domain/usecases/get_companies.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';

import 'home_cubit_test.mocks.dart';

@GenerateMocks([GetCompanies])
void main() {
  late HomeCubit cubit;
  late MockGetCompanies mockGetCompanies;

  final tCompanies = [
    Company(
      userCreated: true,
      name: 'name',
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
    )
  ];

  setUp(() {
    mockGetCompanies = MockGetCompanies();
    when(mockGetCompanies()).thenAnswer((_) async => tCompanies);
    cubit = HomeCubit(mockGetCompanies);
  });

  group('HomeCubit', () {
    HomeInitial initialState = HomeInitial();
    HomeLoading loadingState = HomeLoading();
    HomeLoaded loadedState = HomeLoaded(tCompanies);

    test('should return HomeLoaded when cubit load data is called', () async {
      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadingState, loadedState]));
      cubit.loadData();
    });
  });
}
