import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nft_app_ui/constants.dart';
import 'package:nft_app_ui/models/tab_bar.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

  TabBar get _tabBar => const TabBar(
        labelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        tabs: [
          Tab(
            icon: Icon(
              FontAwesomeIcons.rankingStar,
              size: 20,
            ),
            text: 'Ranking',
          ),
          Tab(
            icon: Icon(
              FontAwesomeIcons.chartLine,
              size: 20,
            ),
            text: 'Activity',
          ),
        ],
        indicatorWeight: 4,
        indicatorColor: Color.fromARGB(255, 234, 0, 255),
      );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 10,
          bottom: PreferredSize(
            preferredSize: _tabBar.preferredSize,
            child: Material(
              color: Constants.nBg,
              child: _tabBar,
            ),
          ),
          backgroundColor: Constants.nBg,
        ),
        backgroundColor: Constants.nBg,
        body: const TabBarView(
          children: [
            Ranking(),
            Activity(),
          ],
        ),
      ),
    );
  }
}
