part of 'own_numbers_cubit.dart';

abstract class OwnNumbersState extends Equatable {
  WatchlistItem get watchlistItem;
  const OwnNumbersState();

  @override
  List<Object> get props => [watchlistItem];
}

class OwnNumbersLoaded extends OwnNumbersState {
  final WatchlistItem watchlistItem;

  OwnNumbersLoaded(this.watchlistItem);
}
