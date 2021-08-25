import 'package:flutter/material.dart';
import 'package:search_calculate/core/widgets/buttons/custom_full_button.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomFullButton(
        title: 'will.woodward.99@icloud.com',
        icon: Image.asset(
          'assets/icons/send_white.png',
          width: 16,
          height: 16,
        ),
        onPressed: () {
          launch('mailto:will.woodward.99@icloud.com');
        },
      ),
    );
  }
}
