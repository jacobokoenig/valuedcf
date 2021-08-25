import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculation_flow/presentation/cubit/own_numbers_cubit.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/calculation_flow_main.dart';
import 'package:search_calculate/calculation_flow/presentation/widgets/own_numbers_row.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/buttons/custom_back_button.dart';
import 'package:search_calculate/core/widgets/buttons/custom_full_button.dart';
import 'package:search_calculate/core/widgets/custom_step_indicator.dart';

class OwnNumbersPage extends StatefulWidget {
  @override
  _OwnNumbersPageState createState() => _OwnNumbersPageState();
}

class _OwnNumbersPageState extends State<OwnNumbersPage> {
  late OwnNumbersCubit _ownNumbersCubit;

  @override
  void initState() {
    _ownNumbersCubit = OwnNumbersCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _ownNumbersCubit,
      child: BlocBuilder<OwnNumbersCubit, OwnNumbersState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: extraLightGray,
            body: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => FocusScope.of(context).unfocus(),
              child: FlexibleScrollView(
                child: SafeArea(
                  bottom: false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: Container(
                          padding: Spacing.standardHorizontalPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      completedSteps: 0,
                                    ),
                                  ),
                                ],
                              ),
                              VerticalSpacing(),
                              OwnNumbersRow(
                                title: 'Business Name',
                                initialValue: state.watchlistItem.company.name,
                                keyboardType: TextInputType.text,
                                onChanged: (str) {
                                  _ownNumbersCubit.updateItem(
                                    state.watchlistItem.copyWith(
                                      company: state.watchlistItem.company.copyWith(name: str),
                                    ),
                                  );
                                },
                              ),
                              VerticalSpacing(),
                              OwnNumbersRow(
                                title: 'Free Cash Flow',
                                initialValue: state.watchlistItem.company.fcf2020.toString(),
                                onChanged: (str) {
                                  _ownNumbersCubit.updateItem(
                                    state.watchlistItem.copyWith(
                                      company: state.watchlistItem.company
                                          .copyWith(fcf2020: double.parse(str)),
                                    ),
                                  );
                                },
                              ),
                              VerticalSpacing(),
                              OwnNumbersRow(
                                title: 'Shares Outstanding',
                                initialValue:
                                    state.watchlistItem.company.sharesOutstanding.toString(),
                                onChanged: (str) {
                                  _ownNumbersCubit.updateItem(
                                    state.watchlistItem.copyWith(
                                      company: state.watchlistItem.company.copyWith(
                                        sharesOutstanding: double.parse(str),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              VerticalSpacing(),
                              OwnNumbersRow(
                                title: 'Total Current Liabilities (Optional)',
                                initialValue: state.watchlistItem.company.shortTermDebt.toString(),
                                onChanged: (str) {
                                  _ownNumbersCubit.updateItem(
                                    state.watchlistItem.copyWith(
                                      company: state.watchlistItem.company.copyWith(
                                        shortTermDebt: 0 - double.parse(str),
                                      ),
                                    ),
                                  );
                                },
                              ),
                              ExpandedContainer(),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: blue,
                        child: SafeArea(
                          top: false,
                          child: CustomFullButton(
                            title: 'Next page',
                            onPressed: () {
                              if (state.watchlistItem.company.name == '' ||
                                  state.watchlistItem.company.fcf2020 == 0 ||
                                  state.watchlistItem.company.sharesOutstanding == 0) {
                                final snackBar = SnackBar(
                                  content: Text('Please fill all required information'),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                return;
                              }
                              push(
                                context,
                                CalculationFlowMain(watchlistItem: state.watchlistItem),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
