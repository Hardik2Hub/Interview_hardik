import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_file_downloader/flutter_file_downloader.dart';
import 'package:music_palyer/Model.dart';

class Controller_Class extends ChangeNotifier {
  Dio dio = Dio();
  List music = [];
  AudioPlayer player = AudioPlayer();
  bool is_play = false;
  double dur = 0;
  static int cur_music = 0;
  static get_cur_index(int index){
    cur_music = index;
    print(cur_music);
  }
  getHttp() async {
    final response =
        await dio.get('https://storage.googleapis.com/uamp/catalog.json');
    Map all_music = response.data;
    music = all_music['music'];
    notifyListeners();
  }

  play_music(Model s) {
    player.play(
      UrlSource('${s.source}'),
    );
    is_play = true;
    notifyListeners();
  }

  pause_music() {
    player.pause();
    is_play = false;
    notifyListeners();
  }

  next_song(int index, List music_all, Model s) {
    cur_music = ++index;
    s.title = music_all[cur_music]['title'];
    s.source = music_all[cur_music]['source'];
    s.image = music_all[cur_music]['image'];
    player.play(
      UrlSource('${s.source}'),
    );
    is_play = true;
    notifyListeners();
  }

  previous_song(int index, List music_all, Model s) {
    cur_music = --index;
    s.title = music_all[cur_music]['title'];
    s.source = music_all[cur_music]['source'];
    s.image = music_all[cur_music]['image'];
    player.play(
      UrlSource('${s.source}'),
    );
    is_play = true;
    notifyListeners();
  }

  download_song(String source) {
    FileDownloader.downloadFile(url: '${source}');
    notifyListeners();
  }


  change_dur() {
    player.onPositionChanged.listen((Duration duration) {
      dur = duration.inSeconds.toDouble();
      print(dur);
      notifyListeners();
    });
  }


  seek_song(double value){
    player.seek(Duration(seconds: value.toInt()),);
    notifyListeners();
  }


}
