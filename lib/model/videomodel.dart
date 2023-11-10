import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideoModel {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  List<Map<String, dynamic>> list = [
    {
      'name': "Pasoori",
      'videopath': "asset/video/coke.mp4",
      'imgpath': "asset/images/pasoori1.jpg",
      'imgpath2': "asset/images/pasoori2.jpg",
    },
    {
      'name': "Herriye",
      'videopath': "asset/video/heeriya.mp4",
      'imgpath': "asset/images/herriye1.jpg",
      'imgpath2': "asset/images/herriye2.jpg",
    },
    {
      'name': "Ramta Jogi",
      'videopath': "asset/video/ramta.mp4",
      'imgpath2': "asset/images/ramtajogi1.jpg",
      'imgpath': "asset/images/ramtajogi2.jpg",
    },
    {
      'name': "yehh Jism",
      'videopath': "asset/video/yehjism.mp4",
      'imgpath': "asset/images/yehjism1.jpg",
      'imgpath2': "asset/images/yehjism2.jpg",
    },
  ];
}
