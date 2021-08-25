import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/widgets/text/heading_4.dart';

class Page0Row extends StatelessWidget {
  final String title;
  final Widget child;

  const Page0Row({Key? key, required this.title, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Heading4(title),
        ),
        VerticalSpacing(12),
        Center(child: child),
      ],
    );
  }
}
