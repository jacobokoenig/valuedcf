import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomTextButton({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: heading3.copyWith(color: blue),
      ),
    );
  }
}
