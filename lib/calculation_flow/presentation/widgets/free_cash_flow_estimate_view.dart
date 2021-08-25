import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/text/heading_1.dart';

class FCFGrowthEstimateView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculationFlowCubit, CalculationFlowState>(
      builder: (context, state) {
        if (state is CalculationFlowInitial) return Container();

        return Column(
          children: [
            Heading1('Free cash flow growth estimate'),
            VerticalSpacing(8),
            RichText(
              text: TextSpan(
                text: '${state.watchlistItem.company.fiveYearAvgFCFGrowth?.split(' = ').first} = ',
                style: heading4,
                children: [
                  TextSpan(
                    text: state.watchlistItem.company.fiveYearAvgFCFGrowth?.split(' = ').last,
                    style: heading3,
                  ),
                ],
              ),
            ),
            VerticalSpacing(8),
            RichText(
              text: TextSpan(
                text: '${state.watchlistItem.company.volatilityScore?.split(' = ').first} = ',
                style: heading4,
                children: [
                  TextSpan(
                    text: state.watchlistItem.company.volatilityScore?.split(' = ').last,
                    style: heading3.copyWith(
                      color: _getColor(
                        state.watchlistItem.company.volatilityScore?.split(' = ').last ?? '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Color _getColor(String string) {
    if (string.toLowerCase().contains('low')) return Colors.green;
    if (string.toLowerCase().contains('medium')) return Colors.orange;
    if (string.toLowerCase().contains('low')) return Colors.red;
    return gray;
  }
}
