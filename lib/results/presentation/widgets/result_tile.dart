import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';
import 'package:search_calculate/core/widgets/text/title.dart';

class ResultTile extends StatelessWidget {
  final String caption;
  final String result;

  const ResultTile({Key? key, required this.caption, required this.result}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Spacing.standardHorizontalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightGray),
      ),
      child: Padding(
        padding: Spacing.smallPadding,
        child: Column(
          children: [
            Heading4(
              caption,
              color: gray.withOpacity(0.6),
              textAlign: TextAlign.center,
            ),
            VerticalSpacing(8),
            TitleHeading(result),
          ],
        ),
      ),
    );
  }
}
