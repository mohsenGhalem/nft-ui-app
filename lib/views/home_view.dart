import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:nft_app_ui/screen/home_screen.dart';
import 'package:nft_app_ui/screen/stats_screen.dart';

import '../constants.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  List<Map<String, Widget>> pages = const [
    {'page': HomeScreen(), 'title': Text("NFT Marketplace")},
    {'page': StatsScreen(), 'title': Text("Stats")}
  ];
  int page = 0;

  bool isLoading = true;

  late AnimationController controller;

  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10));

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isLoading = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: pages[page]['title'],
        backgroundColor: Constants.nBg,
        elevation: 0.1,
        actions: [if (page == 1) SvgPicture.asset(Constants.nMore)],
      ),
      backgroundColor: Constants.nBg,
      body: isLoading
          ? Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 100),
              height: screenHeigh,
              width: screenwidth,
              child: Lottie.asset("assets/loading.json",
                  width: 200,
                  height: 200,
                  controller: controller, onLoaded: (comp) {
                controller.duration = comp.duration;
                controller.forward();
              }),
            )
          : pages[page]['page'],
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        foregroundColor: Constants.nBtn,
        backgroundColor: Constants.nBg3,
        child: SvgPicture.asset(
          Constants.nMinted,
          height: 120,
        ),
        onPressed: () {},
      ),
      bottomNavigationBar: BottomAppBar(
        color: Constants.nBg3,
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          decoration: const BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          alignment: Alignment.bottomCenter,
          height: screenHeigh * 0.065,
          width: screenwidth,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  setState(() {
                    page = 0;
                  });
                },
                child: SvgPicture.asset(Constants.nHome),
              ),
              Hero(
                tag: 'stats',
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    setState(() {
                      page = 1;
                    });
                  },
                  child: SvgPicture.asset(Constants.nStats),
                ),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: SvgPicture.asset(Constants.nExplore),
              ),
              InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {},
                child: SvgPicture.asset(Constants.nProfile2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
