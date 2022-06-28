import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/screens/pageview.dart';
import 'package:text_of_silence_app0/screens/startapp/wifi_screen.dart';
import '../controllers/Provider.dart';
import '../main.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../theme/theme.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        duration: 3002,
        splash:Image.asset('images/logo.png',),
        splashIconSize:100 ,
        //splash: const Icon(Icons.videocam),
        nextScreen: const PageViewScreen() ,
        splashTransition: SplashTransition.sizeTransition,
        pageTransitionType: PageTransitionType.leftToRight,
        //backgroundColor: Colors.black54,
        centered:true ,
        curve: Curves.bounceInOut,
      ),
    );
  }
}