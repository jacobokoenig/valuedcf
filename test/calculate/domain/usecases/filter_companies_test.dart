import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/calculate/domain/usecases/filter_companies.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

void main() {
  late FilterCompanies usecase;

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
    )
  ];

  setUp(() {
    usecase = FilterCompanies();
  });

  group('Filter usecase', () {
    test('should return all companies when query is empty', () async {
      List<Company> result = usecase(tCompanies, '');
      expect(result, tCompanies);
    });

    test('should return only the companies whose names contain the query (case insensitive)',
        () async {
      List<Company> result = usecase(tCompanies, 'Fo');

      expect(
        result,
        [
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
          )
        ],
      );
    });
  });
}
