import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:text_of_silence_app0/theme/theme.dart';

import 'camera_screen.dart';
import 'light.dart';

class AlowAccess extends StatefulWidget {
  const AlowAccess({ Key? key }) : super(key: key);

static const routeName = '/AlowSc';

  @override
  State<AlowAccess> createState() => _AlowAccessState();
}

class _AlowAccessState extends State<AlowAccess> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeNotifier().getTheme(),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Text('These instructions must be executed\n',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    ),
                    Lottie.asset('assets/camera-permission.json'),
                    const Divider(height: 2,),
                    const Text(
                      "Step 3\n",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),

                    const Text(
                      "Please! allow access permission for storage",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),

              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 410, // <-- match_parent
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) =>const CameraScreen(),
                      ),
                      );
                    },
                    child: const Text("Next Step",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurpleAccent,
                        onPrimary: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(25)))),
                  ),
                ),
              )*/
            ],
          ),
        ),
      ),
    );
  }
}