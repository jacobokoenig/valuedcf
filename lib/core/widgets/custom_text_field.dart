import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Color borderColor;
  final Color? backgroundColor;
  final Widget? prefix;
  final String? suffixText;
  final String? placeholder;
  final Widget? suffixIcon;
  final bool enabled;
  final Duration _animationDuration = kThemeChangeDuration;
  final Function(String)? onChanged;
  final TextInputType keyboardType;
  final TextAlign textAlign;

  const CustomTextField({
    Key? key,
    this.controller,
    this.borderColor = lightGray,
    this.backgroundColor,
    this.prefix,
    this.suffixText,
    this.suffixIcon,
    this.placeholder,
    this.enabled = true,
    this.onChanged,
    this.keyboardType = const TextInputType.numberWithOptions(decimal: true),
    this.textAlign = TextAlign.center,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 46,
      duration: _animationDuration,
      padding: EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: backgroundColor ?? (enabled ? null : lightGray),
        border: Border.all(color: borderColor, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: Spacing.smallHorizontalPadding,
              child: TextField(
                controller: controller,
                onChanged: onChanged,
                enabled: enabled,
                textAlignVertical: TextAlignVertical.center,
                cursorColor: blue,
                style: heading3,
                keyboardType: keyboardType,
                textAlign: textAlign,
                onSubmitted: (str) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: heading3.copyWith(color: lightGray),
                  prefixIcon: prefix != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: prefix,
                        )
                      : null,
                  suffixIcon: suffixIcon,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 25,
                    minHeight: 25,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: placeholder != null ? 10 : 14,
                    horizontal: Spacing.smallSpacing,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          if (suffixText != null)
            Row(
              children: [
                Container(
                  color: lightGray,
                  height: 34,
                  width: 1,
                ),
                Padding(
                  padding: Spacing.standardHorizontalPadding,
                  child: Text(
                    suffixText!,
                    style: heading4,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
