import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/text/heading_2.dart';

class BulletPoint extends StatelessWidget {
  final String title;

  const BulletPoint({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      padding: Spacing.standardHorizontalPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: lightGray),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Heading2(title, fontSize: 12),
      ),
    );
  }
}
