import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/page_0_row.dart';
import 'package:search_calculate/core/widgets/custom_switch.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';

class CalculationFlow0 extends StatefulWidget {
  @override
  _CalculationFlow0State createState() => _CalculationFlow0State();
}

class _CalculationFlow0State extends State<CalculationFlow0> {
  final TextEditingController rorTextEditingController = TextEditingController();
  final TextEditingController tgrTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        if (rorTextEditingController.text == '') {
          rorTextEditingController.text =
              state.watchlistItem.calculationData.requiredRateOfReturn?.toStringAsFixed(2) ?? '';
        }

        if (tgrTextEditingController.text == '') {
          tgrTextEditingController.text =
              state.watchlistItem.calculationData.terminalGrowthRate?.toStringAsFixed(2) ?? '';
        }

        return SafeArea(
          bottom: false,
          child: Container(
            padding: Spacing.standardHorizontalPadding,
            child: Column(
              children: [
                VerticalSpacing(),
                Page0Row(
                  title: 'Required Rate of Return',
                  child: Container(
                    width: 140,
                    child: CustomTextField(
                      controller: rorTextEditingController,
                      suffixText: '%',
                      onChanged: (str) {
                        BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
                          state.watchlistItem.calculationData.copyWith(
                            requiredRateOfReturn: double.parse(str),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                VerticalSpacing(),
                Page0Row(
                  title: 'Terminal Growth Rate',
                  child: Container(
                    width: 140,
                    child: CustomTextField(
                      controller: tgrTextEditingController,
                      suffixText: '%',
                      onChanged: (str) {
                        BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
                          state.watchlistItem.calculationData.copyWith(
                            terminalGrowthRate: double.parse(str),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                VerticalSpacing(),
                Page0Row(
                  title: 'Include Cash on Hand & Short Term Debt?',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Heading4('Yes'),
                      HorizontalSpacing(12),
                      CustomSwitch(
                        value: state.watchlistItem.calculationData.includeCOHAndSTD,
                        onChanged: (value) {
                          BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
                            state.watchlistItem.calculationData.copyWith(includeCOHAndSTD: value),
                          );
                        },
                      ),
                      HorizontalSpacing(12),
                      Heading4('No'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
