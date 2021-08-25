import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class TitleHeading extends StatelessWidget {
  final String text;

  const TitleHeading(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: title);
  }
}
