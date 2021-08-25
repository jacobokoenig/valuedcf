import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class SmallIconButton extends StatelessWidget {
  final Widget icon;
  final bool destructive;

  const SmallIconButton({
    Key? key,
    required this.icon,
    this.destructive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 33,
      width: 33,
      decoration: BoxDecoration(
        border: Border.all(
          color: destructive ? red : lightGray,
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
