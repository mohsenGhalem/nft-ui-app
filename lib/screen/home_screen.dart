import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft_app_ui/constants.dart';
import 'package:nft_app_ui/models/home_items.dart';
import 'package:nft_app_ui/screen/stats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    return Container(
      color: Constants.nBg,
      height: screenHeigh,
      width: screenwidth,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FirstView(
                      screenHeigh, screenwidth, 'Music', Constants.nMusic),
                  const SizedBox(width: 15),
                  FirstView(screenHeigh, screenwidth, 'Art', Constants.nArt),
                  const SizedBox(width: 15),
                  FirstView(
                      screenHeigh, screenwidth, 'Virtual', Constants.nVirtual)
                ],
              ),
            ),
            //Trending Collection
            const SizedBox(height: 30),
            const Text(
              '  Trending collection',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.nShadowW,
                  fontSize: 22),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    trendingCollec.length,
                    (index) => secondView(
                        screenwidth: screenwidth,
                        screenHeigh: screenHeigh,
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        items: trendingCollec,
                        index: index,
                        tc: true)),
              ),
            ),
            //Top Seller
            const SizedBox(height: 30),
            const Text(
              '  Top seller',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Constants.nShadowW,
                  fontSize: 22),
            ),
            const SizedBox(height: 30),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    topSeller.length,
                    (index) => secondView(
                        screenwidth: screenwidth,
                        screenHeigh: screenHeigh + 100,
                        icon: const Icon(
                          Icons.favorite_border,
                          color: Colors.grey,
                        ),
                        items: topSeller,
                        index: index,
                        tc: false)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container FirstView(
      double screenHeigh, double screenwidth, String title, String img) {
    return Container(
      height: screenHeigh / 4,
      width: screenwidth * 0.8,
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      child: GlassmorphicContainer(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: screenHeigh / 6),
        width: screenwidth,
        height: screenwidth * 0.55,
        borderRadius: 0,
        linearGradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Constants.nShadowW.withOpacity(0.0),
              Constants.nShadowD.withOpacity(0.0)
            ]),
        border: 0,
        blur: 2.5,
        borderGradient: LinearGradient(colors: [
          Constants.nShadowW.withOpacity(0.0),
          Colors.grey.withOpacity(0.0)
        ]),
        child: Text(
          title,
          style: const TextStyle(
              color: Constants.nShadowW,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class secondView extends StatelessWidget {
  const secondView(
      {Key? key,
      required this.screenwidth,
      required this.screenHeigh,
      required this.icon,
      required this.items,
      required this.index,
      required this.tc})
      : super(key: key);

  final double screenwidth;
  final double screenHeigh;
  final Icon icon;
  final bool tc;
  final List<HomeItems> items;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: screenwidth * 0.5,
      height: screenHeigh / 4,
      borderRadius: 30,
      linearGradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Constants.nShadowW.withOpacity(0.2),
            Constants.nBg3.withOpacity(0.2)
          ]),
      border: 2,
      blur: 8,
      borderGradient: LinearGradient(colors: [
        Constants.nShadowW.withOpacity(0.3),
        Colors.grey.withOpacity(0.3)
      ]),
      child: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 10, right: 20, left: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              items[index].img,
              fit: BoxFit.cover,
            ),
            if (tc)
              const SizedBox(
                height: 8,
              ),
            if (tc)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    items[index].title,
                    style: const TextStyle(
                      color: Constants.nShadowW,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  icon,
                  Text(
                    items[index].likes.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            if (!tc)
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  items[index].title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Constants.nShadowW,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            if (!tc)
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  items[index].hashtag,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.normal,
                      fontSize: 12),
                ),
              ),
            if (!tc)
              const SizedBox(
                height: 2,
              ),
            if (!tc)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(Constants.nEth),
                  Text(
                    ' ${items[index].ethvalue}',
                    style: const TextStyle(
                      color: Constants.nShadowW,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  icon,
                  Text(
                    items[index].likes.toString(),
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
