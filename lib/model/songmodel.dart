import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class ListModel {
  bool issecure = true;
  bool ison = false;
  bool isvolume = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  List<Map<String, dynamic>> list = [
    {
      'name': "Pasoori",
      'songpath': "asset/music/coke.mp3",
      'imgpath': "asset/images/pasoori1.jpg",
      'imgpath2': "asset/images/pasoori2.jpg",
    },
    {
      'name': "Herriye",
      'songpath': "asset/music/heeriya.mp3",
      'imgpath': "asset/images/herriye1.jpg",
      'imgpath2': "asset/images/herriye2.jpg",
    },
    {
      'name': "Ramta Jogi",
      'songpath': "asset/music/ramta.mp3",
      'imgpath2': "asset/images/ramtajogi1.jpg",
      'imgpath': "asset/images/ramtajogi2.jpg",
    },
    {
      'name': "yehh Jism",
      'songpath': "asset/music/yehjism.mp3",
      'imgpath': "asset/images/yehjism1.jpg",
      'imgpath2': "asset/images/yehjism2.jpg",
    },
  ];

  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  List<Color> colorlist = [
    Colors.blue,
    Colors.blueAccent,
    Colors.lightBlue,
    Colors.green,
    Colors.greenAccent,
  ];
}
