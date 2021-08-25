import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/widgets/buttons/custom_back_button.dart';
import 'package:search_calculate/core/widgets/text/heading_1.dart';
import 'package:search_calculate/support/presentation/widgets/bullet_point.dart';
import 'package:search_calculate/support/presentation/widgets/support_button.dart';
import 'package:search_calculate/support/presentation/widgets/video_player.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: Spacing.standardPadding.copyWith(top: 4, bottom: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              VerticalSpacing(8),
              Heading1('To learn everything you need, just watch this 3 minute video'),
              VerticalSpacing(),
              VideoPlayerView(),
              ExpandedContainer(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Heading1('Contact Us'),
              ),
              VerticalSpacing(12),
              BulletPoint(title: 'Got any Questions?'),
              VerticalSpacing(8),
              BulletPoint(title: 'Know how we can make value to me better?'),
              VerticalSpacing(8),
              BulletPoint(title: 'Want us to add a new business to the list?'),
              ExpandedContainer(),
              SupportButton(),
            ],
          ),
        ),
      ),
    );
  }
}
