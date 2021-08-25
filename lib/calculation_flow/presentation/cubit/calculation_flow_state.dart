part of 'calculation_flow_cubit.dart';

abstract class CalculationFlowState extends Equatable {
  final WatchlistItem watchlistItem = WatchlistItem(
    company: Company.empty(),
    calculationData: CalculationData(),
  );

  final int pageIndex = 0;

  CalculationFlowState();

  @override
  List<Object?> get props => [watchlistItem, pageIndex];
}

class CalculationFlowInitial extends CalculationFlowState {}

class CalculationFlowLoaded extends CalculationFlowState {
  final WatchlistItem watchlistItem;
  final int pageIndex;

  CalculationFlowLoaded({required this.watchlistItem, required this.pageIndex});

  @override
  List<Object> get props => [watchlistItem, pageIndex];
}

class CalculationFlowDone extends CalculationFlowState {
  final WatchlistItem watchlistItem;

  CalculationFlowDone({required this.watchlistItem});

  @override
  List<Object> get props => [watchlistItem];
}

class CalculationFlowError extends CalculationFlowState {
  final Key? key;
  final WatchlistItem watchlistItem;
  final String message;
  final int pageIndex;

  CalculationFlowError({
    this.key,
    required this.watchlistItem,
    required this.message,
    required this.pageIndex,
  });

  @override
  List<Object?> get props => [watchlistItem, message, pageIndex, key];
}
