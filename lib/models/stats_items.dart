import 'package:flutter/material.dart';

class StatsItems {
  StatsItems(
      {required this.pic,
      required this.name,
      required this.ethVal,
      required this.pourc,
      required this.pouCorl});
  final String pic;
  final String name;
  final double ethVal;
  final double pourc;
  final Color pouCorl;
}

List<StatsItems> sItems = [
  StatsItems(
    pic: 'assets/images/stats/1.png',
    name: "Azumi",
    ethVal: 200055.02,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/2.png',
    name: "Hape prime",
    ethVal: 180055.45,
    pourc: 33.79,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/3.png',
    name: "Cryoto",
    ethVal: 90055.62,
    pourc: -6.56,
    pouCorl: Colors.red,
  ),
  StatsItems(
    pic: 'assets/images/stats/4.png',
    name: "Ape Club",
    ethVal: 88055.12,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/5.png',
    name: "Bat",
    ethVal: 10055.06,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/6.png',
    name: "Mutant",
    ethVal: 9095.27,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/7.png',
    name: "Metaverse",
    ethVal: 10055.02,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/8.png',
    name: "Mountain",
    ethVal: 80055.73,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/9.png',
    name: "Mutant Ape",
    ethVal: 5055.73,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
  StatsItems(
    pic: 'assets/images/stats/10.png',
    name: "The Sandbox",
    ethVal: 5055.73,
    pourc: 3.99,
    pouCorl: Colors.green,
  ),
];
