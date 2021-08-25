import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/domain/repositories/companies_repository.dart';

class GetCompanies {
  final CompaniesRepositoryContract companiesRepository;

  GetCompanies(this.companiesRepository);

  Future<List<Company>> call() {
    return companiesRepository.getCompanies();
  }
}
