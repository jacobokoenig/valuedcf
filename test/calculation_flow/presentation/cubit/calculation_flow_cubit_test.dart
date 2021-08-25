import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search_calculate/calculation_flow/domain/usecases/validate_form_data.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';

import '../../../_helpers/objects.dart';
import 'calculation_flow_cubit_test.mocks.dart';

@GenerateMocks([ValidateFormData])
void main() {
  late CalculationFlowCubit cubit;
  late MockValidateFormData mockValidateFormData;

  setUp(() {
    mockValidateFormData = MockValidateFormData();
    cubit = CalculationFlowCubit(mockValidateFormData);
  });

  group('CalculationFlowCubit methods', () {
    setUp(() {
      when(mockValidateFormData(any)).thenAnswer((realInvocation) => true);
    });
    test('should emit all companies in the watchlist when cubit is initialised', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );

      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadedState]));
      await cubit.loadData(tWatchlistItem);
    });

    test('should add a page when all method is called', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );
      CalculationFlowLoaded loadedState2 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 1,
      );

      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadedState, loadedState2]));
      await cubit.loadData(tWatchlistItem);
      await cubit.nextPage();
    });

    test('should emit CalculationFlowFinished if page index is 2', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );
      CalculationFlowLoaded loadedState2 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 1,
      );
      CalculationFlowLoaded loadedState3 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 2,
      );
      CalculationFlowDone doneState = CalculationFlowDone(
        watchlistItem: tWatchlistItem,
      );

      expect(cubit.state, initialState);
      expectLater(
        cubit.stream,
        emitsInOrder([
          loadedState,
          loadedState2,
          loadedState3,
          doneState,
        ]),
      );

      await cubit.loadData(tWatchlistItem);
      await cubit.nextPage();
      await cubit.nextPage();
      await cubit.nextPage();
    });

    test('should add a page when all method is called', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );
      CalculationFlowLoaded loadedState2 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 1,
      );
      CalculationFlowLoaded loadedState3 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );

      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadedState, loadedState2, loadedState3]));
      await cubit.loadData(tWatchlistItem);
      await cubit.nextPage();
      await cubit.previousPage();
    });

    test('should update calculation data when method is called', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );

      CalculationData tUpdatedCalculationData = CalculationData(
        calculationType: 'fiveYearAvg2',
        requiredRateOfReturn: 0.12,
        terminalGrowthRate: 0.21,
        includeCOHAndSTD: false,
        marginOfSafety: 0.43,
        numberOfYears: 51,
        percentages: {
          'a': 0.63,
          'b': 1,
        },
      );

      CalculationFlowLoaded loadedState2 = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem.copyWith(calculationData: tUpdatedCalculationData),
        pageIndex: 0,
      );

      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadedState, loadedState2]));
      await cubit.loadData(tWatchlistItem);
      await cubit.updateCalculationData(tUpdatedCalculationData);
    });
  });

  group('form validations', () {
    setUp(() {
      when(mockValidateFormData(any)).thenAnswer((realInvocation) => false);
    });
    test('should return CalculationFlowError if validation returns false', () async {
      CalculationFlowInitial initialState = CalculationFlowInitial();
      CalculationFlowLoaded loadedState = CalculationFlowLoaded(
        watchlistItem: tWatchlistItem,
        pageIndex: 0,
      );

      expect(cubit.state, initialState);
      expectLater(cubit.stream, emitsInOrder([loadedState, isA<CalculationFlowError>()]));
      await cubit.loadData(tWatchlistItem);
      await cubit.nextPage();
    });

    test('should validate page 0\'s parameters', () async {
      await cubit.loadData(tWatchlistItem);
      await cubit.nextPage();

      verify(
        mockValidateFormData([
          tWatchlistItem.calculationData.requiredRateOfReturn,
          tWatchlistItem.calculationData.terminalGrowthRate,
          tWatchlistItem.calculationData.includeCOHAndSTD,
        ]),
      );
    });
  });
}
