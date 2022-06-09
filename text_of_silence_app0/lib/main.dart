import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:text_of_silence_app0/screens/SplashScreen.dart';
import 'package:text_of_silence_app0/screens/carousel_screen.dart';
import 'package:text_of_silence_app0/screens/home_screen.dart';
import 'package:text_of_silence_app0/screens/pageview.dart';
import 'package:text_of_silence_app0/screens/video_screen.dart';
import 'package:text_of_silence_app0/theme/theme.dart';
import 'controllers/Provider.dart';
import 'controllers/color.dart';

void main() async{
  //print(ThemeNotifier().StartApp);

  //ThemeNotifier().StartApp?runApp(const SplashScreen()):runApp(const PageViewScreen());
  //runApp(const SplashScreen());
  //runApp( CarouselScreen());
  runApp(const SplashScreen());
}
class MyTOS extends StatelessWidget {

  const MyTOS({Key? key}) : super(key: key);
  static const routName = '/MyTOS' ;
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

        debugShowCheckedModeBanner: false,
          home: MultiProvider(
          providers: [
            ChangeNotifierProvider (create: (_) => MyProvider()),
            ChangeNotifierProvider<ThemeNotifier>(create: (_) => ThemeNotifier()),
          ],
        //child :ThemeNotifier().StartApp?
        //const HomeScreenTOS():const LightRoomScreen(),
          child :const HomeScreenTOS(),
      ),

    );
  }
}




