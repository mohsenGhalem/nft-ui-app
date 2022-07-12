import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:nft_app_ui/constants.dart';
import 'package:nft_app_ui/models/stats_items.dart';

class Ranking extends StatelessWidget {
  const Ranking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeigh = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final double heightContain = 90.1 * sItems.length;
    return Scaffold(
      body: Container(
        width: screenwidth,
        margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
        child: ListView(
          children: [
            //Categories
            categories(screenwidth),
            const SizedBox(
              height: 10,
            ),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: screenwidth * 0.9,
                  width: screenwidth * 0.9,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: RadialGradient(
                        radius: 100,
                        colors: [Colors.cyan.withOpacity(0.2), Constants.nBg]),
                  ),
                ),
                GlassmorphicContainer(
                  width: screenwidth,
                  height: heightContain,
                  borderRadius: 30,
                  linearGradient: LinearGradient(colors: [
                    Constants.nBtn.withOpacity(0.2),
                    Constants.nBg3.withOpacity(0.2)
                  ]),
                  border: 2,
                  blur: 100,
                  borderGradient: const LinearGradient(
                      colors: [Constants.nBg3, Constants.nBtn]),
                  child: Column(
                    children: List.generate(
                      sItems.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(sItems[index].pic),
                          subtitle: const Text("view info",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500)),
                          title: Text(
                            sItems[index].name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: SizedBox(
                            height: 100,
                            width: 100,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset(Constants.nEth),
                                    Text(
                                      " ${sItems[index].ethVal}",
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Text(
                                  '\n${sItems[index].pourc}%',
                                  style: TextStyle(
                                      color: sItems[index].pouCorl,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row categories(double screenwidth) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 50,
          width: screenwidth * 0.45,
          decoration: BoxDecoration(
            color: Constants.nBtn.withOpacity(0.2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Constants.nBg3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.category,
                color: Colors.grey,
                size: 25,
              ),
              Text(
                'All categories',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Icon(
                FontAwesomeIcons.chevronDown,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ),
        Container(
          height: 50,
          width: screenwidth * 0.45,
          decoration: BoxDecoration(
            color: Constants.nBtn.withOpacity(0.2),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(width: 2, color: Constants.nBg3),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                FontAwesomeIcons.link,
                color: Colors.grey,
                size: 20,
              ),
              Text(
                'All Chaines',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              Icon(
                FontAwesomeIcons.chevronDown,
                color: Colors.grey,
                size: 15,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Activity extends StatelessWidget {
  const Activity({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: null,
      ),
    );
  }
}
