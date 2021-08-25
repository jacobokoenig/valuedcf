import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomBackButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: grayTeal,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(Icons.chevron_left, color: gray),
        ),
      ),
    );
  }
}
