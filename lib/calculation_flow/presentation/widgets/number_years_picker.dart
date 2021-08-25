import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/number_year_container.dart';

class NumberYearsPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return Container(
          padding: Spacing.standardHorizontalPadding,
          child: Row(
            children: [
              ExpandedContainer(),
              NumberYearContainer(5),
              ExpandedContainer(),
              NumberYearContainer(10),
              ExpandedContainer(),
              NumberYearContainer(15),
              ExpandedContainer(),
              NumberYearContainer(20),
              ExpandedContainer(),
            ],
          ),
        );
      },
    );
  }
}
