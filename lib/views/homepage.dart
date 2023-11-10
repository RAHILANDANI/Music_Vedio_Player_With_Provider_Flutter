import 'package:flutter/material.dart';
import 'package:music/model/songmodel.dart';
import 'package:music/model/videomodel.dart';
import 'package:music/provider/videoprovider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../provider/song_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    ListModel listModel = ListModel();
    VideoModel videoModel = VideoModel();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('issignin', false);
                Navigator.pushNamed(context, 'signin');
              },
              icon: Icon(Icons.logout),
            ),
          ],
          title: Text("RAINBOW"),
          centerTitle: true,
          backgroundColor: Colors.black,
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.music_note,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.music_video_outlined,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: listModel.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'songdetails',
                          arguments: index);
                      Provider.of<SongProvider>(context, listen: false)
                          .startmusic(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(6),
                      height: 100,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage(
                                  "${listModel.list[index]['imgpath']}"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              listModel.list[index]['name'],
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                          Icon(
                            Icons.arrow_right,
                            size: 50,
                            color: Colors.white,
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: listModel.colorlist[index],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: Colors.black,
              child: ListView.builder(
                itemCount: videoModel.list.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, 'videodetails',
                          arguments: index);
                      Provider.of<VideoProvider>(context, listen: false)
                          .startvideo(index);
                      Provider.of<VideoProvider>(context, listen: false)
                          .chewiecontroller();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        margin: EdgeInsets.all(6),
                        height: 300,
                        width: double.infinity,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            Center(
                              child: Image.asset(
                                videoModel.list[index]['imgpath'],
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                Icons.play_arrow,
                                size: 40,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2),
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
