import 'dart:convert';

import 'package:search_calculate/home/data/models/company_model.dart';
import 'package:search_calculate/watchlist/data/models/calculation_data_model.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class WatchlistItemModel extends WatchlistItem {
  WatchlistItemModel({
    String? uuid,
    required CompanyModel company,
    required CalculationDataModel calculationData,
  }) : super(
          uuid: uuid,
          company: company,
          calculationData: calculationData,
        );

  factory WatchlistItemModel.fromMap(Map<String, dynamic> map) {
    return WatchlistItemModel(
      uuid: map['uuid'],
      company: CompanyModel.fromMap(map['company']),
      calculationData: CalculationDataModel.fromMap(map['calculation_data']),
    );
  }

  factory WatchlistItemModel.fromJson(String source) =>
      WatchlistItemModel.fromMap(json.decode(source));
}
