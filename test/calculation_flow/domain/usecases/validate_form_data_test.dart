import 'package:flutter_test/flutter_test.dart';
import 'package:search_calculate/calculation_flow/domain/usecases/validate_form_data.dart';

void main() {
  late ValidateFormData usecase;

  setUp(() {
    usecase = ValidateFormData();
  });

  test('should return true when no null parameters are present', () async {
    List<dynamic> params = [true, 1, 'a'];
    bool result = usecase(params);

    expect(result, true);
  });

  test('should return false when null parameters are present', () async {
    List<dynamic> params = [true, null, 'a'];
    bool result = usecase(params);

    expect(result, false);
  });
}
