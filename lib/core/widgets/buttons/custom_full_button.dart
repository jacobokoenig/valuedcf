import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomFullButton extends StatelessWidget {
  final String title;
  final Widget? icon;
  final bool enabled;
  final bool addBorderRadiusToBottom;
  final VoidCallback onPressed;

  const CustomFullButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.enabled = true,
    this.addBorderRadiusToBottom = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.translucent,
      child: Container(
        height: 65,
        decoration: BoxDecoration(
          color: enabled ? blue : extraLightGray,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: addBorderRadiusToBottom ? Radius.circular(10) : Radius.zero,
            bottomRight: addBorderRadiusToBottom ? Radius.circular(10) : Radius.zero,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Visibility(
                visible: icon != null,
                child: Padding(
                  padding: Spacing.smallHorizontalPadding,
                  child: icon,
                ),
              ),
              HorizontalSpacing(4),
              Text(
                title,
                style: heading3.copyWith(color: white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
