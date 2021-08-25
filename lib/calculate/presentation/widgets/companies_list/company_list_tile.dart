import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/icons/large_icon_button.dart';
import 'package:search_calculate/core/widgets/text/heading_3.dart';
import 'package:search_calculate/home/domain/entities/company.dart';

class CompanyListTile extends StatelessWidget {
  final Company company;

  const CompanyListTile({Key? key, required this.company}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LargeIconButton(
            icon: Container(
              padding: Spacing.smallPadding,
              child: company.logo != null ? Image.asset('assets/logos/${company.logo}') : null,
            ),
          ),
          HorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading3(company.name),
                VerticalSpacing(4),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Chip(
                        label: Text(
                          company.ticker,
                          style: TextStyle(color: blue),
                        ),
                        backgroundColor: blue.withOpacity(0.1),
                      ),
                      HorizontalSpacing(8),
                      Chip(
                        label: Text(
                          company.currency,
                          style: TextStyle(color: blue),
                        ),
                        backgroundColor: blue.withOpacity(0.1),
                      ),
                      HorizontalSpacing(8),
                      Chip(
                        label: Text(
                          company.location,
                          style: TextStyle(color: blue),
                        ),
                        backgroundColor: blue.withOpacity(0.1),
                      ),
                      HorizontalSpacing(8),
                      Chip(
                        label: Text(
                          company.exchange,
                          style: TextStyle(color: blue),
                        ),
                        backgroundColor: blue.withOpacity(0.1),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
