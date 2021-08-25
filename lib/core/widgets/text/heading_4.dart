import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class Heading4 extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;

  const Heading4(this.text, {Key? key, this.color, this.textAlign}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: heading4.copyWith(color: color),
      textAlign: textAlign,
    );
  }
}
