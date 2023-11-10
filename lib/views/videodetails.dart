import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:music/model/videomodel.dart';
import 'package:music/provider/videoprovider.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class VideoDetails extends StatefulWidget {
  const VideoDetails({super.key});

  @override
  State<VideoDetails> createState() => _VideoDetailsState();
}

class _VideoDetailsState extends State<VideoDetails> {
  @override
  Widget build(BuildContext context) {
    VideoModel videoModel = VideoModel();
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(videoModel.list[index]['name']),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: (AspectRatio(
          aspectRatio: Provider.of<VideoProvider>(context)
              .videoModel
              .videoPlayerController
              .value
              .aspectRatio,
          child: Chewie(
              controller: Provider.of<VideoProvider>(context)
                  .videoModel
                  .chewieController),
        )),
      ),
    );
  }
}
