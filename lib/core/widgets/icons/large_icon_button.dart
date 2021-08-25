import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class LargeIconButton extends StatelessWidget {
  final Widget icon;
  final double width;
  final double height;

  const LargeIconButton({
    Key? key,
    required this.icon,
    this.width = 80,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: lightGray,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: icon,
      ),
    );
  }
}
