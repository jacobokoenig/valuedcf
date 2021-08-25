import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/home/data/models/company_model.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

void main() {
  final tCompanyModel = CompanyModel(
    name: 'name',
    ticker: 'ticker',
    userCreated: true,
    logo: 'logo',
    location: 'location',
    exchange: 'exchange',
    currency: 'currency',
    fcf2020: 2,
    shortTermDebt: 1,
    sharesOutstanding: 1,
    fiveYearAvgFCFGrowth: 'fiveYearAvgFCFGrowth',
    volatilityScore: 'volatilityScore',
  );

  test(
    'should be a subclass of the Company entity',
    () async {
      // assert
      expect(tCompanyModel, isA<Company>());
    },
  );

  group('fromMap', () {
    test(
      'should return a valid model when passed a Map',
      () async {
        // arrange
        final Map<String, dynamic> map = {
          'name': 'name',
          'ticker': 'ticker',
          'user_created': true,
          'logo': 'logo',
          'location': 'location',
          'exchange': 'exchange',
          'currency': 'currency',
          '2020_fcf': 2,
          'short_term_debt': 1,
          'shares_outstanding': 1,
          '5_year_average_fcf_growth': 'fiveYearAvgFCFGrowth',
          'volatility_score': 'volatilityScore',
        };

        // act
        final result = CompanyModel.fromMap(map);
        // assert
        expect(result, tCompanyModel);
      },
    );
  });
}
