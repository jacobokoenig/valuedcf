import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/results/domain/usecases/calculate_5_year_avg_fair_value.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

void main() {
  late Calculate5YearAvgFairValue calculateFairValue;

  setUp(() {
    calculateFairValue = Calculate5YearAvgFairValue();
  });

  test('should correctly calculate 5 year avg results', () async {
    WatchlistItem tWatchlistItem = WatchlistItem(
      company: Company.empty(
        name: 'name',
        currency: 'USD',
        fcf2020: 100,
        sharesOutstanding: 200,
        shortTermDebt: -300,
      ),
      calculationData: CalculationData(
        requiredRateOfReturn: 10,
        terminalGrowthRate: 3,
        includeCOHAndSTD: true,
        marginOfSafety: 25,
        percentages: {
          '1-5': 12,
          '6-10': 10,
          '11-15': 11,
          '16-20': 15,
        },
      ),
    );
    double result = calculateFairValue(tWatchlistItem);
    expect(double.parse(result.toStringAsFixed(2)), 20.48);
  });
}
