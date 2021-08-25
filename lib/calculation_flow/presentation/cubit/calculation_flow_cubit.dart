import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/calculation_flow/domain/usecases/validate_form_data.dart';
import 'package:search_calculate/home/domain/entities/company.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

part 'calculation_flow_state.dart';

String validationErrorMessage = 'Please fill all fields to proceed';

class CalculationFlowCubit extends Cubit<CalculationFlowState> {
  final ValidateFormData _validateFormData;

  CalculationFlowCubit(this._validateFormData) : super(CalculationFlowInitial());

  loadData(WatchlistItem watchlistItem) {
    emit(
      CalculationFlowLoaded(
        watchlistItem: watchlistItem,
        pageIndex: 0,
      ),
    );
  }

  nextPage() {
    bool validated = false;
    CalculationData data = state.watchlistItem.calculationData;

    // Page should be a model to maintain SOLID principles
    switch (state.pageIndex) {
      case 0:
        validated = _validateFormData([
          data.requiredRateOfReturn,
          data.terminalGrowthRate,
          data.includeCOHAndSTD,
        ]);
        break;
      case 1:
        validated = _validateFormData([
          ...data.percentages.values,
        ]);
        break;
      case 2:
        validated = _validateFormData([
          data.marginOfSafety,
        ]);
        break;
    }

    if (!validated) {
      emit(
        CalculationFlowError(
          key: GlobalKey(),
          watchlistItem: state.watchlistItem,
          pageIndex: state.pageIndex,
          message: validationErrorMessage,
        ),
      );
      return;
    }

    if (state.pageIndex == 2) {
      emit(
        CalculationFlowDone(
          watchlistItem: state.watchlistItem,
        ),
      );
    } else {
      emit(
        CalculationFlowLoaded(
          watchlistItem: state.watchlistItem,
          pageIndex: state.pageIndex + 1,
        ),
      );
    }
  }

  previousPage() {
    if (state.pageIndex != 0) {
      emit(
        CalculationFlowLoaded(
          watchlistItem: state.watchlistItem,
          pageIndex: state.pageIndex - 1,
        ),
      );
    }
  }

  updateCalculationData(CalculationData calculationData) {
    emit(
      CalculationFlowLoaded(
        watchlistItem: state.watchlistItem.copyWith(calculationData: calculationData),
        pageIndex: state.pageIndex,
      ),
    );
  }
}
