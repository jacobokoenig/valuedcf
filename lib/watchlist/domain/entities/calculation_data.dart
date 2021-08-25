import 'dart:convert';

import 'package:equatable/equatable.dart';

const String fiveYearAverageType = 'fiveYearAvg';

class CalculationData extends Equatable {
  final String calculationType;
  final double? requiredRateOfReturn;
  final double? terminalGrowthRate;
  final bool includeCOHAndSTD;
  final double? marginOfSafety;
  final int numberOfYears;
  final Map<String, double?> percentages;

  CalculationData({
    this.calculationType = fiveYearAverageType,
    this.requiredRateOfReturn,
    this.terminalGrowthRate,
    this.includeCOHAndSTD = false,
    this.marginOfSafety,
    this.numberOfYears = 5,
    this.percentages = const {},
  });

  Map<String, dynamic> toMap() {
    return {
      'calculation_type': calculationType,
      'required_ror': requiredRateOfReturn,
      'terminal_growth_rate': terminalGrowthRate,
      'include_coh_std': includeCOHAndSTD,
      'margin_of_safety': marginOfSafety,
      'number_of_years': numberOfYears,
      'percentages': percentages,
    };
  }

  String toJson() => json.encode(toMap());

  CalculationData copyWith({
    String? calculationType,
    double? requiredRateOfReturn,
    double? terminalGrowthRate,
    bool? includeCOHAndSTD,
    double? marginOfSafety,
    int? numberOfYears,
    Map<String, double?>? percentages,
  }) {
    return CalculationData(
      calculationType: calculationType ?? this.calculationType,
      requiredRateOfReturn: requiredRateOfReturn ?? this.requiredRateOfReturn,
      terminalGrowthRate: terminalGrowthRate ?? this.terminalGrowthRate,
      includeCOHAndSTD: includeCOHAndSTD ?? this.includeCOHAndSTD,
      marginOfSafety: marginOfSafety ?? this.marginOfSafety,
      numberOfYears: numberOfYears ?? this.numberOfYears,
      percentages: percentages ?? this.percentages,
    );
  }

  @override
  List<Object?> get props => [
        calculationType,
        requiredRateOfReturn,
        terminalGrowthRate,
        includeCOHAndSTD,
        marginOfSafety,
        numberOfYears,
        percentages,
      ];
}
