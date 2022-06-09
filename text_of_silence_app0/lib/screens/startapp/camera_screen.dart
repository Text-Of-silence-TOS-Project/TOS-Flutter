import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'alow_access.dart';
import 'done.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({ Key? key }) : super(key: key);

static const routeName = '/CameraSc';

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: const Text('These instructions must be executed\n',
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ),
                  Lottie.asset('assets/selfie-phone.json'),
                  const Divider(height: 2,),
                  const Text('Step 4\n',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const Text(
                    "Please! Make sure that is your camera clean and your face in the detected circle",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
           /* Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 410, // <-- match_parent
                  height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>const Done(),
                    ),
                    );
                  },
                  child: const Text("Next Step",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(
                      primary: Colors.deepPurpleAccent,
                      onPrimary: Colors.white,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25)))),
                ),
              )
            )*/
          ],
        ),
      ),
    );
  }
}