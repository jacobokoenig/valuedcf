import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/calculation_flow_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/forms/calculation_flow_0.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/forms/calculation_flow_1.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/forms/calculation_flow_2.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/calculation_flow_header.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/buttons/custom_full_button.dart';
import 'package:search_calculate/get_it.dart';
import 'package:search_calculate/results/presentation/pages/results_page.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class CalculationFlowMain extends StatefulWidget {
  final WatchlistItem watchlistItem;

  const CalculationFlowMain({Key? key, required this.watchlistItem}) : super(key: key);

  @override
  _CalculationFlowMainState createState() => _CalculationFlowMainState();
}

class _CalculationFlowMainState extends State<CalculationFlowMain> {
  late CalculationFlowCubit cubit;

  final PageController pageController = PageController();

  @override
  void initState() {
    cubit = sl.get<CalculationFlowCubit>();
    cubit.loadData(widget.watchlistItem);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: extraLightGray,
        body: BlocListener<CalculationFlowCubit, CalculationFlowState>(
          listener: (context, state) {
            if (state is CalculationFlowError) {
              final snackBar = SnackBar(content: Text(state.message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }

            if (state is CalculationFlowLoaded) {
              if (pageController.page != state.pageIndex) {
                pageController.animateToPage(
                  state.pageIndex,
                  duration: kThemeChangeDuration,
                  curve: Curves.easeOut,
                );
              }
            }

            if (state is CalculationFlowDone) {
              push(context, ResultsPage(watchlistItem: state.watchlistItem));
            }
          },
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SafeArea(
              bottom: false,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CalculationFlowHeader(),
                  VerticalSpacing(),
                  Expanded(
                    child: PageView(
                      controller: pageController,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        CalculationFlow0(),
                        CalculationFlow1(),
                        CalculationFlow2(),
                      ],
                    ),
                  ),
                  VerticalSpacing(),
                  Container(
                    color: blue,
                    child: SafeArea(
                      top: false,
                      child: CustomFullButton(
                        title: 'Next page',
                        onPressed: cubit.nextPage,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
