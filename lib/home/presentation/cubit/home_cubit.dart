import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/domain/usecases/get_companies.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetCompanies _getCompanies;
  HomeCubit(this._getCompanies) : super(HomeInitial());

  loadData() async {
    emit(HomeLoading());
    List<Company> companies = await _getCompanies();
    companies.sort((a, b) => b.fcf2020.compareTo(a.fcf2020));
    emit(HomeLoaded(companies));
  }
}
