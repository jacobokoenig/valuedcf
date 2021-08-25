import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_calculate/calculate/presentation/pages/calculate_page.dart';
import 'package:search_calculate/core/constants/constants.dart';
import 'package:search_calculate/get_it.dart';
import 'package:search_calculate/home/presentation/cubit/home_cubit.dart';
import 'package:search_calculate/main.dart';
import 'package:search_calculate/support/presentation/pages/support_page.dart';
import 'package:search_calculate/watchlist/presentation/pages/watchlist_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homeCubit = sl<HomeCubit>();

  @override
  void initState() {
    super.initState();
    _homeCubit.loadData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _homeCubit,
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (!(state is HomeLoaded)) return Container();
          return DefaultTabController(
            initialIndex: 0,
            length: 3,
            child: Scaffold(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        WatchlistPage(),
                        CalculatePage(),
                        SupportPage(),
                      ],
                    ),
                  ),
                  Container(
                    color: extraLightGray,
                    padding: EdgeInsets.only(bottom: 16),
                    child: TabBar(
                      labelColor: gray,
                      indicator: BoxDecoration(
                        border: Border(
                          top: BorderSide(color: blue, width: 4),
                        ),
                      ),
                      tabs: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Tab(
                            text: 'Watchlist',
                            icon: Icon(
                              Icons.bookmark,
                              color: gray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Tab(
                            text: 'Calculate',
                            icon: Icon(
                              Icons.calculate,
                              color: gray,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Tab(
                            text: 'Support',
                            icon: Icon(
                              Icons.support,
                              color: gray,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
