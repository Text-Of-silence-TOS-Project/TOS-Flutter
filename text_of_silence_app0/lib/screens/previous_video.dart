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
   late VideoPlayerController _controller;
   //late VideoPlayerController _controller;
   late File _Video = File('tos.mp4');
   late final picker = ImagePicker();
   late final videodete;
   late String pred_text = "two and one and ali";
   @override
   void initState() {
     // TODO: implement initState
     _controller = VideoPlayerController.asset('video/tos.mp4')
       ..initialize().then((_) {
         setState(() {});

       });

     _controller = VideoPlayerController.asset('video/tos.mp4')
       ..initialize().then((_) {
         setState(() {});
       });
     super.initState();
   }
   @override
   void dispose() {
     // TODO: implement dispose
     _controller.dispose();
     _controller.dispose();
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

                const Divider(height: 5,),
                const Divider(height: 5,),
                Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 5,),
                const Divider(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 50,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text("Predicted Text :  ",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.schedule_send))),
                      ]),
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
                ),
                const Divider(height: 5,),

                const Divider(height: 5,),
                Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 50,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text("Predicted Text :  ",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.schedule_send))),
                      ]),
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
                            onPressed: (){},
                          ),
                        ),
                      ]),
                ),
                const Divider(height: 5,),

                const Divider(height: 5,),
                Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 50,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text("Predicted Text :  ",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.schedule_send))),
                      ]),
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
                            onPressed: (){},
                          ),
                        ),
                      ]),
                ),
                const Divider(height: 5,),

                const Divider(height: 5,),
                Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 50,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text("Predicted Text :  ",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.schedule_send))),
                      ]),
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
                            onPressed: (){},
                          ),
                        ),
                      ]),
                ),
                const Divider(height: 5,),


                const Divider(height: 5,),
                Container(
                  height: 300,
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  child: AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        VideoPlayer(_controller),
                        _ControlsOverlay(controller: _controller),
                        ClosedCaption(text: _controller.value.caption.text),
                        VideoProgressIndicator(_controller, allowScrubbing: true),
                      ],
                    ),
                  ),
                ),
                const Divider(height: 5,),
                Padding(
                  padding: const EdgeInsets.only(left: 50,),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Text("Predicted Text :  ",
                              style: Theme.of(context).textTheme.headline2),
                        ),
                        Expanded(
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.schedule_send))),
                      ]),
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
                            onPressed: (){},
                          ),
                        ),
                      ]),
                ),
                const Divider(height: 5,),

              ],
            ),
          ),

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