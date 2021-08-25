import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/calculation_segmented_control.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/five_years_avg_form.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/free_cash_flow_estimate_view.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/number_years_picker.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/year_by_year_form.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';

class CalculationFlow1 extends StatefulWidget {
  @override
  _CalculationFlow1State createState() => _CalculationFlow1State();
}

class _CalculationFlow1State extends State<CalculationFlow1> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              padding: Spacing.standardHorizontalPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (state.watchlistItem.company.fiveYearAvgFCFGrowth != null &&
                      state.watchlistItem.company.volatilityScore != null)
                    Column(
                      children: [
                        FCFGrowthEstimateView(),
                        VerticalSpacing(),
                      ],
                    ),
                  Divider(),
                  VerticalSpacing(),
                  CalculationSegmentedControl(),
                  VerticalSpacing(),
                  NumberYearsPicker(),
                  VerticalSpacing(),
                  state.watchlistItem.calculationData.calculationType == fiveYearAverageType
                      ? FiveYearsAvgForm()
                      : YearByYearForm(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
