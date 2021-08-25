import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/page_0_row.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';

class FiveYearsAvgForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: state.watchlistItem.calculationData.numberOfYears >= 5
                      ? Page0Row(
                          title: 'Years 1-5',
                          child: Container(
                            child: CustomTextField(
                              suffixText: '%',
                              onChanged: (str) {
                                BlocProvider.of<CalculationFlowCubit>(context)
                                    .updateCalculationData(
                                  state.watchlistItem.calculationData.copyWith(
                                    terminalGrowthRate: double.parse(str),
                                    percentages: {
                                      ...state.watchlistItem.calculationData.percentages,
                                      '1-5': double.parse(str),
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                ),
                HorizontalSpacing(40),
                Expanded(
                  child: state.watchlistItem.calculationData.numberOfYears >= 10
                      ? Page0Row(
                          title: 'Years 6-10',
                          child: Container(
                            child: CustomTextField(
                              suffixText: '%',
                              onChanged: (str) {
                                BlocProvider.of<CalculationFlowCubit>(context)
                                    .updateCalculationData(
                                  state.watchlistItem.calculationData.copyWith(
                                    terminalGrowthRate: double.parse(str),
                                    percentages: {
                                      ...state.watchlistItem.calculationData.percentages,
                                      '6-10': double.parse(str),
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
            VerticalSpacing(),
            Row(
              children: [
                Expanded(
                  child: state.watchlistItem.calculationData.numberOfYears >= 15
                      ? Page0Row(
                          title: 'Years 11-15',
                          child: Container(
                            child: CustomTextField(
                              suffixText: '%',
                              onChanged: (str) {
                                BlocProvider.of<CalculationFlowCubit>(context)
                                    .updateCalculationData(
                                  state.watchlistItem.calculationData.copyWith(
                                    terminalGrowthRate: double.parse(str),
                                    percentages: {
                                      ...state.watchlistItem.calculationData.percentages,
                                      '11-15': double.parse(str),
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                ),
                HorizontalSpacing(40),
                Expanded(
                  child: state.watchlistItem.calculationData.numberOfYears >= 20
                      ? Page0Row(
                          title: 'Years 16-20',
                          child: Container(
                            child: CustomTextField(
                              suffixText: '%',
                              onChanged: (str) {
                                BlocProvider.of<CalculationFlowCubit>(context)
                                    .updateCalculationData(
                                  state.watchlistItem.calculationData.copyWith(
                                    terminalGrowthRate: double.parse(str),
                                    percentages: {
                                      ...state.watchlistItem.calculationData.percentages,
                                      '16-20': double.parse(str),
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
