import 'dart:convert';

import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final bool userCreated; //Reparse into subclass of Company to maintain SOLID principles
  final String name;
  final String? logo;
  final String ticker;
  final String location;
  final String exchange;
  final String currency;
  final double fcf2020;
  final double shortTermDebt;
  final double sharesOutstanding;
  final String? fiveYearAvgFCFGrowth;
  final String? volatilityScore;

  Company({
    required this.userCreated,
    required this.name,
    required this.ticker,
    required this.logo,
    required this.location,
    required this.exchange,
    required this.currency,
    required this.fcf2020,
    required this.shortTermDebt,
    required this.sharesOutstanding,
    required this.fiveYearAvgFCFGrowth,
    required this.volatilityScore,
  });

  Company.empty({
    this.userCreated = true,
    this.name = '',
    this.ticker = '',
    this.logo,
    this.location = '',
    this.exchange = '',
    this.currency = '',
    this.fcf2020 = 0,
    this.shortTermDebt = 0,
    this.sharesOutstanding = 0,
    this.fiveYearAvgFCFGrowth,
    this.volatilityScore,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'logo': logo,
      'user_created': userCreated,
      'ticker': ticker,
      'location': location,
      'exchange': exchange,
      'currency': currency,
      '2020_fcf': fcf2020,
      'short_term_debt': shortTermDebt,
      'shares_outstanding': sharesOutstanding,
      '5_year_average_fcf_growth': fiveYearAvgFCFGrowth,
      'volatility_score': volatilityScore,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<dynamic> get props {
    return [
      userCreated,
      name,
      logo,
      ticker,
      location,
      exchange,
      currency,
      fcf2020,
      shortTermDebt,
      sharesOutstanding,
      fiveYearAvgFCFGrowth,
      volatilityScore,
    ];
  }

  @override
  bool get stringify => true;

  Company copyWith({
    bool? userCreated,
    String? name,
    String? logo,
    String? ticker,
    String? location,
    String? exchange,
    String? currency,
    double? fcf2020,
    double? shortTermDebt,
    double? sharesOutstanding,
    String? fiveYearAvgFCFGrowth,
    String? volatilityScore,
  }) {
    return Company(
      userCreated: userCreated ?? this.userCreated,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      ticker: ticker ?? this.ticker,
      location: location ?? this.location,
      exchange: exchange ?? this.exchange,
      currency: currency ?? this.currency,
      fcf2020: fcf2020 ?? this.fcf2020,
      shortTermDebt: shortTermDebt ?? this.shortTermDebt,
      sharesOutstanding: sharesOutstanding ?? this.sharesOutstanding,
      fiveYearAvgFCFGrowth: fiveYearAvgFCFGrowth ?? this.fiveYearAvgFCFGrowth,
      volatilityScore: volatilityScore ?? this.volatilityScore,
    );
  }
}
