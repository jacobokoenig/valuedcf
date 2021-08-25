import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/calculate/presentation/widgets/header/own_numbers_button.dart';
import 'package:search_calculate/calculation_flow/presentation/pages/own_numbers_page.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class CalculateHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: blue,
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: Spacing.standardPadding,
          child: OwnNumbersButton(
            onPressed: () {
              push(context, OwnNumbersPage());
            },
          ),
        ),
      ),
    );
  }
}
