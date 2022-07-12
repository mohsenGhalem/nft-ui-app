import 'package:flutter/material.dart';
import 'package:nft_app_ui/constants.dart';

class HomeItems {
  final String title;
  final String img;
  final int likes;
  final String hashtag;
  final double ethvalue;

  HomeItems(
      {required this.title,
      required this.img,
      required this.likes,
      required this.hashtag,
      required this.ethvalue});
}

List<HomeItems> trendingCollec = [
  HomeItems(
      title: '3D Art',
      img: Constants.nTC1,
      likes: 200,
      hashtag: '',
      ethvalue: 0.0),
  HomeItems(
      title: 'Abstract Art',
      img: Constants.nTC2,
      likes: 300,
      hashtag: '',
      ethvalue: 0.0),
  HomeItems(
      title: 'Portrait Art',
      img: Constants.nTC3,
      likes: 500,
      hashtag: '',
      ethvalue: 0.0),
  HomeItems(
      title: 'Metaverse',
      img: Constants.nTC4,
      likes: 100,
      hashtag: '',
      ethvalue: 0.0),
];

List<HomeItems> topSeller = [
  HomeItems(
      title: 'Wave',
      img: Constants.nTS1,
      likes: 5160,
      hashtag: 'wav2 #5672',
      ethvalue: 0.018),
  HomeItems(
      title: 'Avstract Pink',
      img: Constants.nTS2,
      likes: 1800,
      hashtag: 'abstract #2538',
      ethvalue: 0.906),
  HomeItems(
      title: 'Wave',
      img: Constants.nTS3,
      likes: 2030,
      hashtag: 'wavpi #5267',
      ethvalue: 0.26),
  HomeItems(
      title: 'Abstract23',
      img: Constants.nTS4,
      likes: 2060,
      hashtag: 'abstract #2038',
      ethvalue: 0.246),
  HomeItems(
      title: 'Music',
      img: Constants.nTS5,
      likes: 200,
      hashtag: 'mali #7890',
      ethvalue: 0.46),
  HomeItems(
      title: 'Ball',
      img: Constants.nTS6,
      likes: 200,
      hashtag: 'baalli #4849',
      ethvalue: 0.03),
  HomeItems(
      title: 'Ring',
      img: Constants.nTS7,
      likes: 200,
      hashtag: 'Ring #7288',
      ethvalue: 0.106),
  HomeItems(
      title: 'Beer',
      img: Constants.nTS8,
      likes: 200,
      hashtag: 'Beer #1238',
      ethvalue: 0.26),
];
