
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyProvider with ChangeNotifier {
  int _count = 0;
  String _pred_text="";
  String _video_path="";
  bool startApp = false;
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