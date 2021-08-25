import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class Heading2 extends StatelessWidget {
  final String text;
  final double? fontSize;

  const Heading2(this.text, {Key? key, this.fontSize}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: heading2.copyWith(fontSize: fontSize));
  }
}
