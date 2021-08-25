import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

import '../../../_helpers/objects.dart';

void main() {
  late Map<String, dynamic> watchlistMap;
  late WatchlistItem tWatchlistItem;

  setUp(() {
    tWatchlistItem = WatchlistItem(
      company: Company(
        userCreated: false,
        name: 'name',
        ticker: 'ticker',
        logo: 'logo',
        location: 'location',
        exchange: 'exchange',
        currency: 'USD',
        fcf2020: 1,
        shortTermDebt: 3,
        sharesOutstanding: 2,
        fiveYearAvgFCFGrowth: 'a',
        volatilityScore: 'b',
      ),
      calculationData: CalculationData(
        calculationType: 'fiveYearAvg',
        requiredRateOfReturn: 0.1,
        terminalGrowthRate: 0.2,
        includeCOHAndSTD: true,
        marginOfSafety: 0.4,
        numberOfYears: 5,
        percentages: {
          'a': 0.6,
          'b': null,
        },
      ),
    );

    watchlistMap = {
      "uuid": "uuid",
      "company": {
        "name": "name",
        "ticker": "ticker",
        "logo": "logo",
        "location": "location",
        "exchange": "exchange",
        "currency": "USD",
        "user_created": false,
        "2020_fcf": 1,
        "shares_outstanding": 2,
        "short_term_debt": 3,
        '5_year_average_fcf_growth': 'a',
        'volatility_score': 'b',
      },
      "calculation_data": {
        "calculation_type": "fiveYearAvg",
        "required_ror": 0.1,
        "terminal_growth_rate": 0.2,
        "include_coh_std": true,
        "margin_of_safety": 0.4,
        "number_of_years": 5,
        "percentages": {"a": 0.6, "b": null}
      },
    };
  });

  test('should return valid map from model', () {
    Map<String, dynamic> result = tWatchlistItem.copyWith(uuid: "uuid").toMap();
    expect(result, watchlistMap);
  });

  test('should return model from Company', () {
    WatchlistItem result = WatchlistItem.fromCompany(tCompany);
    WatchlistItem expectation = WatchlistItem(
      company: Company(
        userCreated: tCompany.userCreated,
        name: tCompany.name,
        ticker: tCompany.ticker,
        logo: tCompany.logo,
        location: tCompany.location,
        exchange: tCompany.exchange,
        currency: tCompany.currency,
        fcf2020: tCompany.fcf2020,
        shortTermDebt: tCompany.shortTermDebt,
        sharesOutstanding: tCompany.sharesOutstanding,
        fiveYearAvgFCFGrowth: tCompany.fiveYearAvgFCFGrowth,
        volatilityScore: tCompany.volatilityScore,
      ),
      calculationData: CalculationData(),
    );
    expect(result, expectation);
  });
}
