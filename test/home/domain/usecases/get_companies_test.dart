import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/domain/repositories/companies_repository.dart';
import 'package:search_calculate/home/domain/usecases/get_companies.dart';
import 'get_companies_test.mocks.dart';

@GenerateMocks([CompaniesRepositoryContract])
void main() {
  late GetCompanies usecase;
  late MockCompaniesRepositoryContract mockCompaniesRepository;

  setUp(() {
    mockCompaniesRepository = MockCompaniesRepositoryContract();
    usecase = GetCompanies(mockCompaniesRepository);
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

  test('should get templates from the repository', () async {
    when(mockCompaniesRepository.getCompanies()).thenAnswer((_) async => tCompanies);

    List<Company> result = await usecase();

    expect(result, tCompanies);
    verify(mockCompaniesRepository.getCompanies());
    verifyNoMoreInteractions(mockCompaniesRepository);
  });
}
