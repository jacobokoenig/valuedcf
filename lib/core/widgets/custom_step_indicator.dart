import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomStepIndicator extends StatelessWidget {
  final int totalSteps;
  final int completedSteps;

  CustomStepIndicator({
    Key? key,
    required this.totalSteps,
    required this.completedSteps,
  }) : super(key: key) {
    assert(
      completedSteps <= totalSteps,
      'Current step index cannot be higher than maximum step index',
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Row(
        children: List.generate(
          totalSteps,
          (index) => Expanded(
            child: Padding(
              padding: Spacing.smallHorizontalPadding / 2,
              child: AnimatedContainer(
                height: 4,
                duration: kThemeAnimationDuration,
                decoration: BoxDecoration(
                  color: index >= completedSteps ? lightBlue : blue,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
