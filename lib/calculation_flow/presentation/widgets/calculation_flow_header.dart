import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/core/widgets/buttons/custom_back_button.dart';
import 'package:search_calculate/core/widgets/company_logo_name.dart';
import 'package:search_calculate/core/widgets/custom_step_indicator.dart';

class CalculationFlowHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return Container(
          padding: Spacing.standardHorizontalPadding,
          child: Column(
            children: [
              Row(
                children: [
                  CustomBackButton(
                    onPressed: () => pop(context),
                  ),
                  HorizontalSpacing(),
                  Expanded(
                    child: CustomStepIndicator(
                      totalSteps: 3,
                      completedSteps: state.pageIndex + 1,
                    ),
                  ),
                ],
              ),
              VerticalSpacing(24),
              CompanyLogoName(
                name: state.watchlistItem.company.name,
                logoFilename: state.watchlistItem.company.logo,
              ),
            ],
          ),
        );
      },
    );
  }
}
