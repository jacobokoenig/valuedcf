part of 'watchlist_cubit.dart';

abstract class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object> get props => [];
}

class WatchlistInitial extends WatchlistState {}

class WatchlistLoaded extends WatchlistState {
  final List<WatchlistItem> watchlistItems;

  WatchlistLoaded(this.watchlistItems);

  @override
  List<Object> get props => [watchlistItems];
}
