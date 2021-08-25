import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';
import 'package:search_calculate/watchlist/domain/entities/calculation_data.dart';

class CalculationSegmentedControl extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        int indexSelected =
            state.watchlistItem.calculationData.calculationType == fiveYearAverageType ? 0 : 1;

        return CupertinoSlidingSegmentedControl(
          groupValue: indexSelected,
          thumbColor: blue,
          backgroundColor: lightGray,
          children: {
            0: Container(
              height: 38,
              child: Center(
                child: Heading4("5 Year Average", color: indexSelected == 0 ? white : gray),
              ),
            ),
            1: Container(
              height: 42,
              child: Center(
                child: Heading4("Year by Year", color: indexSelected == 1 ? white : gray),
              ),
            ),
          },
          onValueChanged: (i) {
            BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
              state.watchlistItem.calculationData.copyWith(
                calculationType: i == 0 ? 'fiveYearAvg' : 'yearByYear',
              ),
            );
          },
        );
      },
    );
  }
}
