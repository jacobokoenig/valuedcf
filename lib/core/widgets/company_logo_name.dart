import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/widgets/icons/large_icon_button.dart';
import 'package:search_calculate/core/widgets/text/heading_2.dart';

class CompanyLogoName extends StatelessWidget {
  final String name;
  final String? logoFilename;

  const CompanyLogoName({Key? key, required this.name, this.logoFilename}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (logoFilename != null)
            Row(
              children: [
                LargeIconButton(
                  icon: Container(
                    padding: Spacing.smallPadding,
                    child: Image.asset('assets/logos/$logoFilename'),
                  ),
                ),
                HorizontalSpacing(),
              ],
            ),
          Heading2(name),
        ],
      ),
    );
  }
}
