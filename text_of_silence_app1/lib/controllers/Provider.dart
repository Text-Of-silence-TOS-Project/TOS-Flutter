
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

class MyProvider with ChangeNotifier {
  int _count = 0;
  String _pred_text="";
  String _video_path="";
  bool startApp = false;
  bool pickVidoe = false;
  var UploadVideo;
  ///------------------------
  int get count => _count;
  setindex(int i) {
    _count=i;
    notifyListeners();
  }
  ///------------------------
  String get Pred_Text_method => _pred_text;
  set_Pred_Text_method(String s) {
    _pred_text=s;
    notifyListeners();
  }
  ///------------------------
  String get Video_Path => _video_path;
  set_Video_Path(String s) {
    _video_path=s;
       notifyListeners();
     }
  //   ///------------------------
  bool get pick_vidoe => pickVidoe;
  set_pickVidoe(bool c) {
    pickVidoe=c;
    notifyListeners();
  }
//   ///------------------------
  VideoPlayerController get Upload_Video => UploadVideo;
  set_Upload_Video(VideoPlayerController c) {
    UploadVideo=c;
    notifyListeners();
  }
  //-----------
  void increment() {
    _count++;
    notifyListeners();
  }
///------------------------
 bool get started => startApp;

  setStarted(bool t) {
     startApp=t;
    notifyListeners();
   }
//   ///------------------------
}