import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class Heading3 extends StatelessWidget {
  final String text;
  final Color? color;

  const Heading3(this.text, {Key? key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: heading3.copyWith(color: color));
  }
}
