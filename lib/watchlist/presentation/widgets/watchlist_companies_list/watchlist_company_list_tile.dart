import 'package:bmcommons/bmcommons.dart';
import 'package:flutter/material.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/core/widgets/icons/large_icon_button.dart';
import 'package:search_calculate/core/widgets/text/heading_3.dart';
import 'package:search_calculate/watchlist/domain/entities/watchlist_item.dart';

class WatchlistCompanyListTile extends StatelessWidget {
  final WatchlistItem watchlistItem;

  const WatchlistCompanyListTile({Key? key, required this.watchlistItem}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LargeIconButton(
            icon: Container(
              padding: Spacing.smallPadding,
              child: watchlistItem.company.logo != null
                  ? Image.asset('assets/logos/${watchlistItem.company.logo}')
                  : null,
            ),
          ),
          HorizontalSpacing(),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Heading3(watchlistItem.company.name),
                VerticalSpacing(4),
                RichText(
                  text: TextSpan(
                    text: 'Price target ',
                    style: heading4,
                    children: [
                      // TextSpan(
                      //   text: '\$${watchlistItem.fairValueWithMOS}',
                      //   style: heading3,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
