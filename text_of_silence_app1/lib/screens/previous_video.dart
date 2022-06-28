import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../controllers/Provider.dart';
import '../theme/theme.dart';

class PreviousVideo extends StatefulWidget {

  const PreviousVideo({Key? key}) : super(key: key);
  @override
  _PreviousVideoState createState() => _PreviousVideoState();
}
class _PreviousVideoState extends State<PreviousVideo> {
  var theme = ValueNotifier(ThemeMode.dark);
   late TextEditingController mytext= TextEditingController();
   late VideoPlayerController _controller1;
  late VideoPlayerController _controller2;
  late VideoPlayerController _controller3;
  late VideoPlayerController _controller4;
  late VideoPlayerController _controller5;
  late VideoPlayerController _controller6;
  late VideoPlayerController _controller7;
   late File _Video = File('tos.mp4');
   late final picker = ImagePicker();
   late final videodete;
   late String pred_text = "bin blue at a six now";
   @override
   void initState() {
     // TODO: implement initState
     _controller1 = VideoPlayerController.asset('video/amr.mp4')
       ..initialize().then((_) {
         setState(() {});

       });

     _controller2 = VideoPlayerController.asset('video/amr2.mp4')
       ..initialize().then((_) {
         setState(() {});
       });
     _controller3 = VideoPlayerController.asset('video/bbae7n.mp4')
       ..initialize().then((_) {
         setState(() {});

       });
     _controller4 = VideoPlayerController.asset('video/bbae8n.mp4')
       ..initialize().then((_) {
         setState(() {});

       });
     _controller5 = VideoPlayerController.asset('video/bbae9n.mp4')
       ..initialize().then((_) {
         setState(() {});

       });
     _controller6 = VideoPlayerController.asset('video/omda.mp4')
       ..initialize().then((_) {
         setState(() {});

       });
     _controller7 = VideoPlayerController.asset('video/bbaf3s.mp4')
       ..initialize().then((_) {
         setState(() {});

       });
     super.initState();
   }
   @override
   void dispose() {
     // TODO: implement dispose
     _controller1.dispose();
     _controller2.dispose();
     _controller3.dispose();
     _controller4.dispose();
     _controller5.dispose();
     _controller6.dispose();
     _controller7.dispose();


     super.dispose();
   }
  @override

  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: Scaffold(
          body: Center(
            child: ListView(
              children: [
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller1.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller1),
                            _ControlsOverlay(controller: _controller1),
                            ClosedCaption(text: _controller1.value.caption.text),
                            VideoProgressIndicator(_controller1, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text('bin white with r nine soon',
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
              ],
          ),
                const SizedBox(height: 5,child: Divider(height: 5),),
                /*Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller2.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller2),
                            _ControlsOverlay(controller: _controller2),
                            ClosedCaption(text: _controller2.value.caption.text),
                            VideoProgressIndicator(_controller2, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(pred_text,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 5,child: Divider(height: 5),),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller3.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller3),
                            _ControlsOverlay(controller: _controller3),
                            ClosedCaption(text: _controller3.value.caption.text),
                            VideoProgressIndicator(_controller3, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(pred_text,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 5,child: Divider(height: 5),),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller4.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller4),
                            _ControlsOverlay(controller: _controller4),
                            ClosedCaption(text: _controller4.value.caption.text),
                            VideoProgressIndicator(_controller4, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(pred_text,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                const SizedBox(height: 5,child: Divider(height: 5),),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller5.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller5),
                            _ControlsOverlay(controller: _controller5),
                            ClosedCaption(text: _controller5.value.caption.text),
                            VideoProgressIndicator(_controller5, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(pred_text,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),*/
                const SizedBox(height: 5,child: Divider(height: 5),),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller6.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller6),
                            _ControlsOverlay(controller: _controller6),
                            ClosedCaption(text: _controller6.value.caption.text),
                            VideoProgressIndicator(_controller6, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(' bin white at p two now',
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
                /*const SizedBox(height: 5,child: Divider(height: 5),),
                Column(
                  children: [
                    Container(
                      height: 350,
                      width: 300,
                      padding: const EdgeInsets.all(20),
                      child: AspectRatio(
                        aspectRatio: _controller7.value.aspectRatio,
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: <Widget>[
                            VideoPlayer(_controller7),
                            _ControlsOverlay(controller: _controller7),
                            ClosedCaption(text: _controller7.value.caption.text),
                            VideoProgressIndicator(_controller7, allowScrubbing: true),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 50,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              child: Text(pred_text,
                                  style: Theme.of(context).textTheme.headline1),
                            ),
                            Expanded(
                              child: IconButton(
                                icon: const Icon(Icons.copy),
                                onPressed: (){
                                  print(pred_text);
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ));
                                  Provider.of<MyProvider>(context,listen: false).set_Pred_Text_method(pred_text);
                                },
                              ),
                            ),
                          ]),
                    )
                  ],
                ),
*/
              ],
            ),
        )
          ),
        ),
    );
   }
}
class _ControlsOverlay extends StatelessWidget {
  const _ControlsOverlay({Key? key, required this.controller})
      : super(key: key);

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration(milliseconds: 0),
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];
  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
  ];

  final VideoPlayerController controller;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
            color: Colors.black26,
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 100.0,
                semanticLabel: 'Play',
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),

        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}