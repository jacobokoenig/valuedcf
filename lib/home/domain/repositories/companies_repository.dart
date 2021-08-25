import 'package:search_calculate/home/domain/entities/company.dart';

abstract class CompaniesRepositoryContract {
  Future<List<Company>> getCompanies();
}
