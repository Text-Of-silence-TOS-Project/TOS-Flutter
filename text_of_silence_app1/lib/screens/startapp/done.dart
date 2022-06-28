import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/main.dart';

import '../../controllers/Provider.dart';
import '../../theme/theme.dart';


class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  static const routeName = '/DoneSc';

  @override
  State<Done> createState() => DoneState();
}

class DoneState extends State<Done> {
  static bool doNotShowMeAgain = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  Lottie.asset('assets/3091-process-complete.json'),
                  const Divider(height: 2,),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "You are done",
                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: Column(
                children: [/*
                  CheckboxListTile(
                    value: doNotShowMeAgain,
                    controlAffinity: ListTileControlAffinity.leading,
                    checkColor: Colors.deepPurpleAccent,
                    onChanged: (value) {
                      setState(() {
                        doNotShowMeAgain = value!;
                        print(doNotShowMeAgain);
                        doNotShowMeAgain?ThemeNotifier().setStarted():ThemeNotifier().unsetStarted();
                      });
                    },
                    title: const Text(
                        'I understand, Do not show me instructions again !!'),
                  ),
                  SizedBox(
                    width: 410, // <-- match_parent
                    height: 50, // <-- match-parent
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyTOS(),
                          ),
                        );
                      },
                      child: const Text("Start App",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurpleAccent,
                          onPrimary: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(25)))),
                    ),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
