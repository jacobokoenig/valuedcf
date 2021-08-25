import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/icons/small_icon_button.dart';
import 'package:search_calculate/core/widgets/text/heading_3.dart';

class OwnNumbersButton extends StatelessWidget {
  final VoidCallback onPressed;

  const OwnNumbersButton({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 58,
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: Spacing.smallHorizontalPadding,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ExpandedContainer(),
              Heading3('Use my own numbers'),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: SmallIconButton(
                    icon: Image.asset(
                      'assets/icons/question_mark_icon.png',
                      height: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
