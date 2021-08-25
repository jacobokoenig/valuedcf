import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';

class Tags extends StatelessWidget {
  final List<String> tags;

  const Tags({Key? key, required this.tags}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: tags.length,
        separatorBuilder: (context, index) => HorizontalSpacing(8),
        itemBuilder: (context, index) {
          return Container(
            height: 28,
            padding: Spacing.smallHorizontalPadding * 2,
            decoration: BoxDecoration(
              color: lightBlue,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Text(
                tags[index],
                style: heading5.copyWith(color: blue),
              ),
            ),
          );
        },
      ),
    );
  }
}
