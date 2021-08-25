import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';

class YearByYearForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return Column(
          children: List.generate(
            state.watchlistItem.calculationData.numberOfYears,
            (index) => _getRow('20${index + 21}', context, state),
          ),
        );
      },
    );
  }

  Widget _getRow(String text, BuildContext context, CalculationFlowState state) {
    int startYear = 2021;
    double currentFreeCashFlow = state.watchlistItem.company.fcf2020;

    while (startYear <= int.parse(text)) {
      currentFreeCashFlow = currentFreeCashFlow *
          (1 +
              ((state.watchlistItem.calculationData.percentages[startYear.toString()] ?? 0) / 100));
      startYear += 1;
    }

    return Column(
      children: [
        Row(
          children: [
            Expanded(child: Heading4(text)),
            HorizontalSpacing(8),
            Expanded(
              flex: 3,
              child: CustomTextField(
                key: GlobalKey(),
                controller: TextEditingController(text: currentFreeCashFlow.round().toString()),
                enabled: false,
              ),
            ),
            HorizontalSpacing(8),
            Expanded(
              flex: 3,
              child: CustomTextField(
                suffixText: '%',
                onChanged: (str) {
                  BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
                    state.watchlistItem.calculationData.copyWith(
                      percentages: {
                        ...state.watchlistItem.calculationData.percentages,
                        text: str == '' ? 0 : double.parse(str),
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        VerticalSpacing(),
      ],
    );
  }
}
