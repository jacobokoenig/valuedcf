import 'dart:convert';

import 'package:equatable/equatable.dart';

import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:uuid/uuid.dart';

class WatchlistItem extends Equatable {
  late final String uuid;
  final Company company;
  final CalculationData calculationData;

  WatchlistItem({
    String? uuid,
    required this.company,
    required this.calculationData,
  }) {
    this.uuid = uuid ?? const Uuid().v4();
  }

  factory WatchlistItem.fromCompany(Company company) {
    return WatchlistItem(
      company: company,
      calculationData: CalculationData(),
    );
  }

  WatchlistItem copyWith({
    String? uuid,
    Company? company,
    CalculationData? calculationData,
  }) {
    return WatchlistItem(
      uuid: uuid ?? this.uuid,
      company: company ?? this.company,
      calculationData: calculationData ?? this.calculationData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uuid': uuid,
      'company': company.toMap(),
      'calculation_data': calculationData.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [company, calculationData];
}
