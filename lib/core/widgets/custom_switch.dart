import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class CustomSwitch extends StatefulWidget {
  final bool value;
  final Function(bool)? onChanged;
  final String activeText;
  final String inactiveText;

  const CustomSwitch({
    Key? key,
    required this.value,
    this.onChanged,
    this.activeText = 'Yes',
    this.inactiveText = 'No',
  }) : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  final Duration _colorChangeDuration = Duration(milliseconds: 300);
  final Duration _movementDuration = Duration(milliseconds: 100);

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: _movementDuration,
    );

    _circleAnimation = AlignmentTween(
      begin: widget.value ? Alignment.centerLeft : Alignment.centerRight,
      end: widget.value ? Alignment.centerRight : Alignment.centerLeft,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            if (_animationController.isCompleted) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }

            if (widget.onChanged != null) {
              widget.onChanged!(!widget.value);
            }
          },
          child: Container(
            width: 60.0,
            height: 40.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Color(0xFFFAFAFA),
              border: Border.all(color: lightGray, width: 1),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0, bottom: 6.0, right: 5.0, left: 5.0),
              child: Align(
                alignment: _circleAnimation.value,
                child: AnimatedContainer(
                  duration: _colorChangeDuration,
                  width: 28.0,
                  height: 28.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        begin: widget.value ? Alignment.topCenter : Alignment.topRight,
                        end: widget.value ? Alignment.bottomRight : Alignment.bottomCenter,
                        colors: [
                          widget.value ? blue : mediumGray,
                          widget.value ? lightBlue : lightGray,
                        ]),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
