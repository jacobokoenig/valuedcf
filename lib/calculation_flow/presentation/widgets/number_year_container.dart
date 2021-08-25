import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/core/constants/constants.dart';

class NumberYearContainer extends StatelessWidget {
  final int number;

  const NumberYearContainer(this.number, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        bool selected = state.watchlistItem.calculationData.numberOfYears == number;

        return InkWell(
          onTap: () {
            BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
              state.watchlistItem.calculationData.copyWith(
                numberOfYears: number,
              ),
            );
          },
          child: Container(
            height: 28,
            width: 40,
            decoration: BoxDecoration(
              color: selected ? extraLightGray : white,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: lightGray,
              ),
            ),
            child: Center(
              child: Text(
                number.toString(),
                style: heading5.copyWith(color: selected ? gray : gray.withOpacity(0.8)),
              ),
            ),
          ),
        );
      },
    );
  }
}
