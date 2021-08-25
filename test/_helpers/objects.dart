import 'package:search_calculate/home/data/models/company_model.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/data/models/calculation_data_model.dart';
import 'package:search_calculate/watchlist/data/models/watchlist_item_model.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

final tCompany = Company(
  name: 'name',
  ticker: 'ticker',
  userCreated: true,
  logo: 'logo',
  location: 'location',
  exchange: 'exchange',
  currency: 'currency',
  fcf2020: 111,
  shortTermDebt: -500,
  sharesOutstanding: 350,
  fiveYearAvgFCFGrowth: '1',
  volatilityScore: 'volatilityScore',
);

final tCompanyModel = CompanyModel(
  name: 'name',
  ticker: 'ticker',
  userCreated: true,
  logo: 'logo',
  location: 'location',
  exchange: 'exchange',
  currency: 'currency',
  fcf2020: 111,
  shortTermDebt: -500,
  sharesOutstanding: 350,
  fiveYearAvgFCFGrowth: '1',
  volatilityScore: 'volatilityScore',
);

CalculationDataModel tCalculationDataModel = CalculationDataModel(
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
);

WatchlistItemModel tWatchlistItemModel = WatchlistItemModel(
  company: tCompanyModel,
  calculationData: tCalculationDataModel,
);

CalculationData tCalculationData = CalculationData(
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
);

WatchlistItem tWatchlistItem = WatchlistItem(
  company: tCompany,
  calculationData: tCalculationData,
);
