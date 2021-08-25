import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/page_0_row.dart';
import 'package:search_calculate/core/widgets/custom_text_field.dart';

class CalculationFlow2 extends StatefulWidget {
  @override
  _CalculationFlow2State createState() => _CalculationFlow2State();
}

class _CalculationFlow2State extends State<CalculationFlow2> {
  final TextEditingController mosTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        if (mosTextEditingController.text == '') {
          mosTextEditingController.text =
              state.watchlistItem.calculationData.marginOfSafety?.toStringAsFixed(2) ?? '';
        }

        return SafeArea(
          bottom: false,
          child: Container(
            padding: Spacing.standardHorizontalPadding,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Page0Row(
                  title: 'Margin Of Safety',
                  child: Container(
                    width: 140,
                    child: CustomTextField(
                      controller: mosTextEditingController,
                      suffixText: '%',
                      onChanged: (str) {
                        BlocProvider.of<CalculationFlowCubit>(context).updateCalculationData(
                          state.watchlistItem.calculationData.copyWith(
                            marginOfSafety: double.parse(str),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                VerticalSpacing(80),
              ],
            ),
          ),
        );
      },
    );
  }
}
