import 'package:search_calculate/home/data/models/company_model.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

class CompaniesFixtureDatasource {
  final List<Map<String, dynamic>> templateData;

  CompaniesFixtureDatasource(this.templateData);

  List<Company> getCompanies() {
    return List<Map<String, dynamic>>.from(templateData)
        .map((e) => CompanyModel.fromMap(e))
        .toList();
  }
}
