part of 'results_cubit.dart';

abstract class ResultsState extends Equatable {
  double? get fairValue;
  double? get fairValueWithMOS;

  const ResultsState();

  @override
  List<Object?> get props => [fairValue, fairValueWithMOS];
}

class ResultsInitial extends ResultsState {
  final double? fairValue = null;
  final double? fairValueWithMOS = null;

  ResultsInitial();

  @override
  List<Object?> get props => [fairValue, fairValueWithMOS];
}

class ResultsLoaded extends ResultsState {
  final double fairValue;
  final double fairValueWithMOS;

  ResultsLoaded(this.fairValue, this.fairValueWithMOS);
  @override
  List<Object?> get props => [fairValue, fairValueWithMOS];
}

class ResultsAddedToWatchlist extends ResultsState {
  final double fairValue;
  final double fairValueWithMOS;
  final Key? key;

  ResultsAddedToWatchlist({
    this.key,
    required this.fairValue,
    required this.fairValueWithMOS,
  });

  @override
  List<Object?> get props => [key, fairValue, fairValueWithMOS];
}

class ResultsAlreadyExistsOnWatchlist extends ResultsState {
  final double fairValue;
  final double fairValueWithMOS;
  final Key? key;

  ResultsAlreadyExistsOnWatchlist({
    this.key,
    required this.fairValue,
    required this.fairValueWithMOS,
  });

  @override
  List<Object?> get props => [key, fairValue, fairValueWithMOS];
}
