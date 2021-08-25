import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/calculate/domain/usecases/filter_companies.dart';
import 'package:search_calculate/calculate/presentation/cubit/calculate_cubit.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';

import 'calculate_cubit_test.mocks.dart';

@GenerateMocks([HomeCubit, FilterCompanies])
void main() {
  late CalculateCubit cubit;
  late MockFilterCompanies mockFilterCompanies;
  late MockHomeCubit mockHomeCubit;

  final tCompanies = [
    Company(
      userCreated: true,
      name: 'foo',
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
    Company(
      userCreated: true,
      name: 'fuo',
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

  final tFilteredCompanies1 = [
    Company(
      userCreated: true,
      name: 'foo',
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
    Company(
      userCreated: true,
      name: 'fuo',
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

  final tFilteredCompanies2 = [
    Company(
      userCreated: true,
      name: 'foo',
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

  final query1 = 'f';
  final query2 = 'fo';

  setUp(() {
    mockHomeCubit = MockHomeCubit();
    mockFilterCompanies = MockFilterCompanies();

    when(mockHomeCubit.state).thenAnswer((_) => HomeLoaded(tCompanies));
    when(mockFilterCompanies(tCompanies, '')).thenAnswer((_) => tCompanies);
    when(mockFilterCompanies(tCompanies, query1)).thenAnswer((_) => tFilteredCompanies1);
    when(mockFilterCompanies(tCompanies, query2)).thenAnswer((_) => tFilteredCompanies2);

    cubit = CalculateCubit(mockHomeCubit, mockFilterCompanies);
  });

  group('CalculateCubit', () {
    CalculateFilteredCompanies initialCompaniesFilteredState =
        CalculateFilteredCompanies(tCompanies);
    CalculateFilteredCompanies filteredCompaniesFilteredState1 =
        CalculateFilteredCompanies(tFilteredCompanies1);
    CalculateFilteredCompanies filteredCompaniesFilteredState2 =
        CalculateFilteredCompanies(tFilteredCompanies2);

    test('should return all companies when cubit is initialised', () async {
      expect(cubit.state, initialCompaniesFilteredState);
    });

    test('should return filtered companies when search is called with query', () async {
      expectLater(cubit.stream,
          emitsInOrder([filteredCompaniesFilteredState1, filteredCompaniesFilteredState2]));
      cubit.filterCompanies(query1);
      cubit.filterCompanies(query2);
    });
  });
}
