import 'package:search_calculate/home/domain/entities/company.dart';

class FilterCompanies {
  List<Company> call(List<Company> companies, String query) {
    if (query == '') return companies;

    List<Company> filteredCompanies;

    filteredCompanies = companies
        .where((element) => element.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return filteredCompanies;
  }
}
