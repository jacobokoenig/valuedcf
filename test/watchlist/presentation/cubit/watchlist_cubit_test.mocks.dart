// Mocks generated by Mockito 5.0.13 from annotations
// in search_calculate/test/watchlist/presentation/cubit/watchlist_cubit_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart'
    as _i5;
import 'package:search_calculate/watchlist/domain/repositories/watchlist_repository_contract.dart'
    as _i2;
import 'package:search_calculate/watchlist/domain/usecases/get_watchlist.dart'
    as _i3;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis

class _FakeWatchlistRespoitoryContract extends _i1.Fake
    implements _i2.WatchlistRespoitoryContract {}

/// A class which mocks [GetWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlist extends _i1.Mock implements _i3.GetWatchlist {
  MockGetWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.WatchlistRespoitoryContract get watchlistRespoitoryContract =>
      (super.noSuchMethod(Invocation.getter(#watchlistRespoitoryContract),
              returnValue: _FakeWatchlistRespoitoryContract())
          as _i2.WatchlistRespoitoryContract);
  @override
  _i4.Future<List<_i5.WatchlistItem>> call() =>
      (super.noSuchMethod(Invocation.method(#call, []),
              returnValue:
                  Future<List<_i5.WatchlistItem>>.value(<_i5.WatchlistItem>[]))
          as _i4.Future<List<_i5.WatchlistItem>>);
  @override
  String toString() => super.toString();
}
