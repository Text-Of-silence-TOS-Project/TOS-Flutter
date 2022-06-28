import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'camera_screen.dart';
import 'light.dart';

class WifiScreen extends StatefulWidget {
  const WifiScreen({Key? key}) : super(key: key);
  static const routName = '/WifiScreen' ;
  @override
  State<WifiScreen> createState() => _WifiScreenState();
}

class _WifiScreenState extends State<WifiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
                  Lottie.asset('assets/103925-router-blue-wifi.json',fit: BoxFit.cover),
                  const Divider(height: 2,),
                  const Text('Step 1\n',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  const Text('Please! Turn on WIFI:\n',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                   builder: (context) =>const RoomLight(),
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
             ),),
           )*/

          ],

        ),
      ),

    );
  }
}
