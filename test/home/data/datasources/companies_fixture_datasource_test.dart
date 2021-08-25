import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/home/data/datasources/companies_fixture_datasource.dart';
import 'package:search_calculate/home/data/models/company_model.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

void main() {
  late CompaniesFixtureDatasource datasource;

  final templatesData = [
    {
      "logo": "https://drive.google.com/file/d/1_iHmfSbaa6BX_pWZivcHMjjgEguQzzD3/view?usp=sharing",
      "ticker": "AAPL",
      "user_created": true,
      "name": "Apple",
      "sector": "Technology",
      "location": "USA",
      "exchange": "Nasdaq",
      "currency": "USD",
      "2020_fcf": 73365000,
      "short_term_debt": -67376000,
      "shares_outstanding": 16687631,
      "5_year_average_fcf_growth": "previous 5 year average = 2.69%",
      "volatility_score": "free cash flow volatility = MEDIUM"
    }
  ];

  final tTemplates = [
    CompanyModel.fromMap(templatesData[0]),
  ];

  setUp(() {
    datasource = CompaniesFixtureDatasource(templatesData);
  });

  test('should return templates from fixture', () async {
    List<Company> result = datasource.getCompanies();
    expect(result, tTemplates);
  });
}
