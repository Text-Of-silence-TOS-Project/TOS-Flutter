import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/screens/startapp/alow_access.dart';
import 'package:text_of_silence_app0/screens/startapp/camera_screen.dart';
import 'package:text_of_silence_app0/screens/startapp/done.dart';
import 'package:text_of_silence_app0/screens/startapp/light.dart';
import 'package:text_of_silence_app0/screens/startapp/wifi_screen.dart';

import '../theme/theme.dart';


class CarouselScreen extends StatelessWidget {
  const CarouselScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeNotifier().getTheme(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter Carousel Slider Example'),
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CarouselSlider(
                items: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset('assets/103925-router-blue-wifi.json'),

                        const Text(
                          'Step 1: Please! Turn on WIFI:\n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.teal,
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset('assets/2049-light.json'),

                        const Text(
                          "Step 2: Please! Open room light source",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset('assets/camera-permission.json'),
                        const Text(
                          "Step 3: Please! allow access permission for storage",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset('assets/selfie-phone.json',width: double.infinity),
                        const Text(
                          "Step 4: Make sure that is your camera clean and your face in the detected circle",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Lottie.asset('assets/3091-process-complete.json',width: double.infinity),
                        const Text(
                          "You are done",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.deepPurple,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
                //Slider Container properties
                options: CarouselOptions(
                  autoPlay: true,
                  height: 500,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: SizedBox(
                  width: 400, // <-- match_parent
                  height: 40, // <-- match-parent
                  child: ElevatedButton(
                    onPressed: () {
                      /*  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyTOS(),
                      ),
                    );*/
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
                ),
              )
            ],
          ),
        ),

    );
  }
}
