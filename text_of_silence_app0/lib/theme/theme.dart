import 'package:flutter/material.dart';
import '../services/storage_manager.dart';

class ThemeNotifier with ChangeNotifier {

  final darkTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.black,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        selectedIconTheme: IconThemeData(color:Colors.white,size: 20),
        selectedItemColor: Colors.white,
        unselectedIconTheme: IconThemeData(color:Colors.white38,size: 20,),
        //selectedLabelStyle: TextStyle(fontSize: 15,)


    ),

    appBarTheme: const AppBarTheme(backgroundColor:Colors.black54,titleTextStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
        iconTheme: IconThemeData(color: Colors.grey) ),

    tabBarTheme:  const TabBarTheme(labelColor: Colors.grey,unselectedLabelColor: Colors.white),

    floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor: Colors.white,) ,

    //primarySwatch: Colors.grey,
    iconTheme: const IconThemeData(color: Colors.white),
    textTheme:const TextTheme(

        headline2:TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
        headline1: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold)
    ) ,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: Colors.black),
    dividerColor: Colors.black12,
    primaryColor: Colors.black,
    brightness: Brightness.dark,
    backgroundColor: const Color(0xFF212121),
    primarySwatch: Colors.grey,
    //accentIconTheme: IconThemeData(color: Colors.grey),
    //dividerColor: Colors.grey,
  );

  final lightTheme = ThemeData(
    backgroundColor: Colors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Colors.transparent,
      showUnselectedLabels: false,
      showSelectedLabels: false,
      selectedIconTheme: IconThemeData(color:Colors.deepPurpleAccent,size: 20),
      selectedItemColor: Colors.deepPurpleAccent,
      unselectedIconTheme: IconThemeData(color:Colors.black54,size: 20,),
      selectedLabelStyle: TextStyle(fontSize: 15,)

    ),
    appBarTheme:    const AppBarTheme(backgroundColor:Colors.transparent,elevation: 0,titleTextStyle: TextStyle(color: Colors.deepPurpleAccent,fontWeight: FontWeight.bold,fontSize: 20),
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent) ),
    tabBarTheme:  const TabBarTheme(labelColor: Colors.deepPurpleAccent,unselectedLabelColor: Colors.white),

    floatingActionButtonTheme:const FloatingActionButtonThemeData(backgroundColor: Colors.deepPurpleAccent,) ,

    scaffoldBackgroundColor: Colors.white,

    primarySwatch: Colors.deepPurple,
    textTheme:const TextTheme(headline2:TextStyle(color: Colors.deepPurpleAccent,fontSize: 18,fontWeight: FontWeight.bold),
    headline1: TextStyle(color: Colors.green,fontSize: 15,fontWeight: FontWeight.bold)
    ) ,

    iconTheme:const IconThemeData(color: Colors.black) ,
    primaryIconTheme:const IconThemeData(color:Colors.black ) ,

    primaryColor: Colors.deepPurpleAccent,
    //brightness: Brightness.light,

    //const Color(0xFFE5E5E5),
    accentColor: Colors.indigo,
    accentIconTheme: IconThemeData(color: Colors.indigo),
    dividerColor: Colors.deepPurpleAccent,
  );

  ThemeData _themeData = ThemeData.dark();
  ThemeData getTheme() => _themeData;

  var StartApp = true;
  var unStartApp = false;
  ThemeNotifier() {
    StorageManager.readData('themeMode').then((value) {
      print('value read from storage: ' + value.toString());
      var themeMode = value ?? 'light';
      if (themeMode == 'light') {

        _themeData = lightTheme;
      } else {
        print('setting dark theme');
        _themeData = darkTheme;
      }
      notifyListeners();
    });
    StorageManager.readData('SaveStartApp').then((value) {
      print('SaveStartApp read from storage: ' + value.toString());
      var stApp = value ;
      if (StartApp) {
        StartApp = stApp;
      } else {
        unStartApp = stApp;
      }
      notifyListeners();
    });
  }

  void setDarkMode() async {
    _themeData = darkTheme;
    StorageManager.saveData('themeMode', 'dark');
    notifyListeners();
  }
  void setLightMode() async {
    _themeData = lightTheme;
    StorageManager.saveData('themeMode', 'light');
    notifyListeners();
  }

  void setStarted() async {
    StartApp = true;
    StorageManager.saveData('SaveStartApp', true);
    notifyListeners();
  }
  void unsetStarted() async {
    unStartApp = false;
    StorageManager.saveData('SaveStartApp', false);
    notifyListeners();
  }

}