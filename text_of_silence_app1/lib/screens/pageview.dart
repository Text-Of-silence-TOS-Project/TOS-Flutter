import 'package:flutter/material.dart';
import 'package:text_of_silence_app0/screens/startapp/alow_access.dart';
import 'package:text_of_silence_app0/screens/startapp/camera_screen.dart';
import 'package:text_of_silence_app0/screens/startapp/done.dart';
import 'package:text_of_silence_app0/screens/startapp/light.dart';
import 'package:text_of_silence_app0/screens/startapp/wifi_screen.dart';

import '../main.dart';
import '../theme/theme.dart';
import 'SplashScreen.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeNotifier().getTheme(),
      debugShowCheckedModeBanner: false,
      home: MyHomePage2(),
    );
  }
}
class MyHomePage2 extends StatefulWidget {
  @override
  _MyHomePage2State createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {

  PageController controller=PageController();
  final List<Widget> _list=<Widget>[
    const Center(child: WifiScreen()),
    const Center(child:RoomLight()),
    const Center(child:AlowAccess()),
    const Center(child:CameraScreen()),
    const Center(child:Done()),

  ];
  int _curr=0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeNotifier().getTheme(),
      home: Scaffold(
          backgroundColor: ThemeNotifier().getTheme()==ThemeNotifier().darkTheme?Colors.black26:Colors.white,
          appBar: AppBar(
            title: const Text('Text Of Silence'),
            actions: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text(
                  "Page: "+(
                      _curr+1).toString()+"/"+_list.length.toString(),textScaleFactor: 1),
              )
            ],
          ),
          body: PageView(
            children:
            _list,
            scrollDirection: Axis.horizontal,

            // reverse: true,
            // physics: BouncingScrollPhysics(),
            controller: controller,
            onPageChanged: (num){
              setState(() {
                _curr=num;
              });
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton.extended(
                    onPressed: (){

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyTOS(),
                        ),
                      );
                      },
            icon: const Icon(Icons.navigate_next),
            label: const Text("Start App"),

      )
      ),
    );
  }
}

class Pages extends StatelessWidget {
  final text;
  Pages({this.text});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Text(text,textAlign: TextAlign.center,style: const TextStyle(
                fontSize: 30,fontWeight:FontWeight.bold),),
          ]
      ),
    );
  }
}

