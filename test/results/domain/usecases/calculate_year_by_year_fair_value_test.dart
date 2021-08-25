import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/results/domain/usecases/calculate_year_by_year_fair_value.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

void main() {
  late CalculateYearByYearFairValue calculateFairValue;

  setUp(() {
    calculateFairValue = CalculateYearByYearFairValue();
  });

  test('should correctly calculate year by year results', () async {
    WatchlistItem tWatchlistItem = WatchlistItem(
      company: Company.empty(
        name: 'name',
        currency: 'USD',
        fcf2020: 200,
        sharesOutstanding: 350,
        shortTermDebt: -500,
      ),
      calculationData: CalculationData(
        requiredRateOfReturn: 10,
        terminalGrowthRate: 3,
        includeCOHAndSTD: true,
        marginOfSafety: 25,
        percentages: {
          '2021': -44.5,
          '2022': 11,
          '2023': 11,
          '2024': 11,
          '2025': 11,
          '2026': 3.85,
          '2028': 14.29,
        },
      ),
    );
    double result = calculateFairValue(tWatchlistItem);
    expect(double.parse(result.toStringAsFixed(2)), 4.77);
  });
}
