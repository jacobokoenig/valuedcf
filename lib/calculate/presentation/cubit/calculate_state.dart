part of 'calculate_cubit.dart';

abstract class CalculateState extends Equatable {
  const CalculateState();

  @override
  List<Object> get props => [];
}

class CalculateInitial extends CalculateState {}

class CalculateFilteredCompanies extends CalculateState {
  final List<Company> companies;
  CalculateFilteredCompanies(this.companies);

  @override
  List<Object> get props => [companies];
}
