import 'package:fitness/Features/home/presentation/tab/advance_tag.dart';
import 'package:fitness/Features/home/presentation/tab/beginner_tab.dart';
import 'package:fitness/Features/home/presentation/tab/intermediate_tab.dart';
import 'package:fitness/Features/home/presentation/widget/detilsScreen.dart';
import 'package:fitness/constants.dart';
import 'package:fitness/core/unit/styles.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late final TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: DefaultTabController(
          length: 3,
          child: NestedScrollView(
            // physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverToBoxAdapter(
                  child: DetilsScreen(),
                ),
                SliverAppBar(
                  pinned: true,
                  elevation: 3,
                  backgroundColor: background,
                  automaticallyImplyLeading: false,
                  shape: Border(
                      bottom: BorderSide(
                          width: 10,
                          color: const Color(0xFFAAAAAA).withOpacity(0))),
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(1),
                    child: tab(),
                  ),
                )
              ],
              body: const TabBarView(
                  children: [
                    BeginnerTab(),
                    Intermediate(),
                    Advance(),
                  ])),
        ),
      ),
    );
  }

  TabBar tab() {
    return TabBar(
        unselectedLabelColor: primary,
        labelColor: Colors.white,
        indicatorColor: text,
        indicatorWeight: 3,
        tabs: [
          _tabItem(label: "Beginner"),
          _tabItem(label: "Intermediate"),
          _tabItem(label: "Advance"),
        ]);
  }

  Tab _tabItem({required String label}) {
    return Tab(
      child: Text(
        label,
        style: Styles.textStyle16,
      ),
    );
  }

}
