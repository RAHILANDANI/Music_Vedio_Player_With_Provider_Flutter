import 'package:flutter/material.dart';
import 'package:music/provider/song_provider.dart';
import 'package:music/provider/videoprovider.dart';
import 'package:music/views/homepage.dart';
import 'package:music/views/sign_in.dart';
import 'package:music/views/sign_up.dart';
import 'package:music/views/songdetails.dart';
import 'package:music/views/videodetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(),
        )
      ],
      builder: (context, _) => MaterialApp(
        initialRoute: (prefs.getBool('issignin') == true) ? '/' : 'signin',
        routes: {
          '/': (context) => MyApp(),
          'songdetails': (context) => SongDetails(),
          'videodetails': (context) => VideoDetails(),
          'signin': (context) => signin(),
          'signup': (context) => signup(),
        },
      ),
    ),
  );
}
