import 'dart:math';

import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class Calculate5YearAvgFairValue {
  double call(WatchlistItem watchlistItem) {
    if (watchlistItem.calculationData.requiredRateOfReturn == null ||
        watchlistItem.calculationData.terminalGrowthRate == null) {
      throw (Exception('Data missing'));
    }

    double requiredRateOfReturn = watchlistItem.calculationData.requiredRateOfReturn! / 100;
    double terminalGrowthRate = watchlistItem.calculationData.terminalGrowthRate! / 100;
    double totalCurrentLiabilities = watchlistItem.company.shortTermDebt;
    double sharesOutstanding = watchlistItem.company.sharesOutstanding;
    bool includeCOHAndSTD = watchlistItem.calculationData.includeCOHAndSTD;

    int currentYear = 2021;
    double currentFreeCashFlow = watchlistItem.company.fcf2020;
    int currentExponent = 1;

    List<double> freeCashFlows = [];
    List<double> discountedFreeCashFlows = [];

    while (currentYear <= 2040) {
      String applicablePercentageKey = '1-5';

      if (currentYear > 2025) applicablePercentageKey = '6-10';
      if (currentYear > 2030) applicablePercentageKey = '11-15';
      if (currentYear > 2035) applicablePercentageKey = '16-20';

      double? applicablePercentage =
          watchlistItem.calculationData.percentages[applicablePercentageKey];

      if (applicablePercentage == null) break;

      currentFreeCashFlow = currentFreeCashFlow * (1 + (applicablePercentage / 100));

      freeCashFlows.add(currentFreeCashFlow);

      double discountedFreeCashFlow =
          currentFreeCashFlow / pow(1 + requiredRateOfReturn, currentExponent);

      discountedFreeCashFlows.add(discountedFreeCashFlow);

      currentYear += 1;
      currentExponent += 1;
    }

    double terminalValue = freeCashFlows.where((e) => e != 0).last *
        ((1 + terminalGrowthRate) / (requiredRateOfReturn - terminalGrowthRate));

    double discountedTerminalValue = terminalValue /
        pow((1 + requiredRateOfReturn), discountedFreeCashFlows.where((e) => e != 0).length)
            .toDouble();

    double allDiscountedValues =
        discountedFreeCashFlows.reduce((a, b) => a + b) + discountedTerminalValue;

    if (includeCOHAndSTD) {
      allDiscountedValues += totalCurrentLiabilities;
    }

    return allDiscountedValues / sharesOutstanding;
  }
}
