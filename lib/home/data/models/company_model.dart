import 'package:search_calculate/home/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({
    required bool userCreated,
    required String name,
    required String? logo,
    required String ticker,
    required String location,
    required String exchange,
    required String currency,
    required double fcf2020,
    required double shortTermDebt,
    required double sharesOutstanding,
    required String? fiveYearAvgFCFGrowth,
    required String? volatilityScore,
  }) : super(
          userCreated: userCreated,
          name: name,
          ticker: ticker,
          logo: logo,
          location: location,
          exchange: exchange,
          currency: currency,
          fcf2020: fcf2020,
          shortTermDebt: shortTermDebt,
          sharesOutstanding: sharesOutstanding,
          fiveYearAvgFCFGrowth: fiveYearAvgFCFGrowth,
          volatilityScore: volatilityScore,
        );

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      userCreated: map['user_created'] ?? false,
      name: map['name'],
      ticker: map['ticker'],
      logo: map['logo'],
      location: map['location'],
      exchange: map['exchange'],
      currency: map['currency'],
      fcf2020: map['2020_fcf'].toDouble(),
      shortTermDebt: map['short_term_debt'].toDouble(),
      sharesOutstanding: map['shares_outstanding'].toDouble(),
      fiveYearAvgFCFGrowth: map['5_year_average_fcf_growth'],
      volatilityScore: map['volatility_score'],
    );
  }
}
