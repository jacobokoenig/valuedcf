import 'package:search_calculate/home/data/datasources/companies_fixture_datasource.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/domain/repositories/companies_repository.dart';

class CompaniesRepository extends CompaniesRepositoryContract {
  final CompaniesFixtureDatasource companiesFixtureDatasource;

  CompaniesRepository(this.companiesFixtureDatasource);

  Future<List<Company>> getCompanies() async {
    return companiesFixtureDatasource.getCompanies();
  }
}
