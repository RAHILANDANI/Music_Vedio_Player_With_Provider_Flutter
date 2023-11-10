import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:music/model/songmodel.dart';

class SongProvider extends ChangeNotifier {
  ListModel listModel = ListModel();

  void startmusic(int index) {
    listModel.assetsAudioPlayer.open(Audio(
      listModel.list[index]['songpath'],
    ));
    notifyListeners();
  }

  void playorpausemusic() {
    listModel.ison = !listModel.ison;
    listModel.assetsAudioPlayer.playOrPause();
    notifyListeners();
  }

  void stopmusic() {
    listModel.assetsAudioPlayer.dispose();
    notifyListeners();
  }

  void silentmusic() {
    if (listModel.isvolume) {
      listModel.assetsAudioPlayer.setVolume(100);
    } else {
      listModel.assetsAudioPlayer.setVolume(00);
    }
    listModel.isvolume = !listModel.isvolume;
    notifyListeners();
  }

  void slider(double value) {
    final position = Duration(
      seconds: value.toInt(),
    );
    listModel.assetsAudioPlayer.seek(position);
    notifyListeners();
  }

  void secure() {
    listModel.issecure = !listModel.issecure;
    notifyListeners();
  }
}
