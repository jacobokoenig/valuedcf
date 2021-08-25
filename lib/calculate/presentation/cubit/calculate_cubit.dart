import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:search_calculate/calculate/domain/usecases/filter_companies.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';

part 'calculate_state.dart';

class CalculateCubit extends Cubit<CalculateState> {
  final HomeCubit _homeCubit;
  final FilterCompanies _filterCompanies;

  CalculateCubit(this._homeCubit, this._filterCompanies) : super(CalculateInitial()) {
    assert(
      _homeCubit.state is HomeLoaded,
      'View containing CalculateCubit should not be initialised until HomeCubit has a HomeLoaded state',
    );

    var homeState = _homeCubit.state as HomeLoaded;

    emit(CalculateFilteredCompanies(homeState.companies));
  }

  filterCompanies(String query) {
    assert(
      this.state is CalculateFilteredCompanies,
      'View containing widget that can call this method should not be initialised until CalculateFilteredCompanies has been emitted',
    );

    var homeState = _homeCubit.state as HomeLoaded;

    List<Company> filteredCompanies = _filterCompanies(homeState.companies, query.toLowerCase());
    emit(CalculateFilteredCompanies(filteredCompanies));
  }
}
