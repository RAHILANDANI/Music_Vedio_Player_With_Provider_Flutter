import 'package:flutter/material.dart';
import 'package:music/model/songmodel.dart';
import 'package:music/provider/song_provider.dart';
import 'package:provider/provider.dart';

class SongDetails extends StatefulWidget {
  const SongDetails({super.key});

  @override
  State<SongDetails> createState() => _SongDetailsState();
}

class _SongDetailsState extends State<SongDetails> {
  @override
  Widget build(BuildContext context) {
    var providerplaying = Provider.of<SongProvider>(context);
    var providerplayingfalse =
        Provider.of<SongProvider>(context, listen: false);
    ListModel listModel = ListModel();
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Now Playing ${listModel.list[index]['name']}"),
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              listModel.list[index]['imgpath2'],
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              height: 250,
              width: 250,
              child: Image.asset(
                listModel.list[index]['imgpath'],
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "${listModel.list[index]['name']}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        providerplayingfalse.stopmusic();
                      },
                      icon: Icon(
                        Icons.stop,
                        size: 50,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        providerplayingfalse.playorpausemusic();
                      },
                      icon: (providerplaying.listModel.ison)
                          ? Icon(
                              Icons.play_arrow,
                              size: 50,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.pause,
                              size: 50,
                              color: Colors.white,
                            ),
                    ),
                    IconButton(
                      onPressed: () {
                        providerplayingfalse.silentmusic();
                      },
                      icon: (providerplaying.listModel.isvolume == true)
                          ? Icon(
                              Icons.headset_off,
                              size: 50,
                              color: Colors.white,
                            )
                          : Icon(
                              Icons.headset,
                              size: 50,
                              color: Colors.white,
                            ),
                    )
                  ],
                ),
                Slider(
                  inactiveColor: Colors.white,
                  min: 0,
                  max: listModel.duration.inSeconds.toDouble(),
                  value: listModel.position.inSeconds.toDouble(),
                  onChanged: (value) {
                    providerplayingfalse.slider(value);
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
