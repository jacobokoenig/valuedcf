import 'dart:convert';

import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';

class CalculationDataModel extends CalculationData {
  CalculationDataModel({
    String? calculationType,
    double? requiredRateOfReturn,
    double? terminalGrowthRate,
    bool includeCOHAndSTD = false,
    double? marginOfSafety,
    int? numberOfYears,
    required Map<String, double?> percentages,
  }) : super(
          calculationType: calculationType ?? 'fiveYearAvg',
          requiredRateOfReturn: requiredRateOfReturn,
          terminalGrowthRate: terminalGrowthRate,
          includeCOHAndSTD: includeCOHAndSTD,
          marginOfSafety: marginOfSafety,
          numberOfYears: numberOfYears = 5,
          percentages: percentages,
        );

  factory CalculationDataModel.fromMap(Map<String, dynamic> map) {
    return CalculationDataModel(
      calculationType: map['calculation_type'],
      requiredRateOfReturn: map['required_ror'],
      terminalGrowthRate: map['terminal_growth_rate'],
      includeCOHAndSTD: map['include_coh_std'],
      marginOfSafety: map['margin_of_safety'],
      numberOfYears: map['number_of_years'],
      percentages: Map<String, double?>.from(map['percentages'] ?? {}),
    );
  }

  factory CalculationDataModel.fromJson(String source) =>
      CalculationDataModel.fromMap(json.decode(source));
}
