// Mocks generated by Mockito 5.0.13 from annotations
// in search_calculate/test/watchlist/domain/usecases/get_watchlist_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart'
    as _i4;
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart'
    as _i2;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

/// A class which mocks [WatchlistRespoitoryContract].
///
/// See the documentation for Mockito's code generation for more information.
class MockWatchlistRespoitoryContract extends _i1.Mock
    implements _i2.WatchlistRespoitoryContract {
  MockWatchlistRespoitoryContract() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<dynamic> addToWatchlist(_i4.WatchlistItem? watchlistItem) =>
      (super.noSuchMethod(Invocation.method(#addToWatchlist, [watchlistItem]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<dynamic> removeFromWatchlist(_i4.WatchlistItem? watchlistItem) =>
      (super.noSuchMethod(
          Invocation.method(#removeFromWatchlist, [watchlistItem]),
          returnValue: Future<dynamic>.value()) as _i3.Future<dynamic>);
  @override
  _i3.Future<List<_i4.WatchlistItem>> getWatchlistItems() =>
      (super.noSuchMethod(Invocation.method(#getWatchlistItems, []),
              returnValue:
                  Future<List<_i4.WatchlistItem>>.value(<_i4.WatchlistItem>[]))
          as _i3.Future<List<_i4.WatchlistItem>>);
  @override
  String toString() => super.toString();
}
