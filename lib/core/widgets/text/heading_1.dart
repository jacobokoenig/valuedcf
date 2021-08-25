import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class Heading1 extends StatelessWidget {
  final String text;

  const Heading1(this.text, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text, style: heading1);
  }
}
