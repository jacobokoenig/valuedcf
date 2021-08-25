import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/watchlist/data/models/calculation_data_model.dart';
import '../../../_helpers/fixture_reader.dart';
import '../../../_helpers/objects.dart';

void main() {
  late String calculationDataJson;

  setUp(() {
    calculationDataJson = fixture('calculation_data.json');
  });

  test('should return model from JSON', () {
    CalculationDataModel result = CalculationDataModel.fromJson(calculationDataJson);
    expect(result, tCalculationDataModel);
  });
}
