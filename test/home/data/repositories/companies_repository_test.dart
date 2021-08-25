import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/home/data/datasources/companies_fixture_datasource.dart';
import 'package:search_calculate/home/data/repositories/companies_repository.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

import 'companies_repository_test.mocks.dart';
// import 'templates_repository_impl_test.mocks.dart';

@GenerateMocks([CompaniesFixtureDatasource])
void main() {
  late CompaniesRepository repository;
  late MockCompaniesFixtureDatasource mockCompaniesLocalDatasource;

  setUp(() {
    mockCompaniesLocalDatasource = MockCompaniesFixtureDatasource();
    repository = CompaniesRepository(mockCompaniesLocalDatasource);
  });

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

  test('should return templates from local datasource', () async {
    when(mockCompaniesLocalDatasource.getCompanies()).thenAnswer((_) => tCompanies);

    List<Company> result = await repository.getCompanies();

    expect(result, tCompanies);
    verify(mockCompaniesLocalDatasource.getCompanies());
    verifyNoMoreInteractions(mockCompaniesLocalDatasource);
  });
}
