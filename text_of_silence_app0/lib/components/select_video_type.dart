import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:flutter/services.dart';
import '../controllers/Provider.dart';
import '../screens/startapp/light.dart';
import '../theme/theme.dart';

class SelectVideoType extends StatefulWidget {

  const SelectVideoType({Key? key}) : super(key: key);

  @override
  _SelectVideoTypeState createState() => _SelectVideoTypeState();
}

class _SelectVideoTypeState extends State<SelectVideoType> {
  late VideoPlayerController _controller;

  //late VideoPlayerController _controllerGallery;
  late File _Video = File('tos.mp4');
  late ImagePicker picker = ImagePicker();
  late final videodete;
  late String pred_text = "bin blue at a one  ";
  var visible = true;
  late XFile? pickedFile;


  Widget visFloat() {
    return SwitchListTile(
        contentPadding: const EdgeInsets.all(15),
        value: visible,
        title: const Text("Visible"),
        onChanged: (val) {
          setState(() {
            visible = val;
          });
        });
  }

  void _uploadvideo() async {
    var url = Uri.parse('https://b55a-156-203-31-246.eu.ngrok.io/');
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', _Video.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      // ignore: avoid_print
      print("Uploaded successfully ");
    } else {
      // ignore: avoid_print
      print("Loaded file path is ... ");
    }
  }

  _getText() async {
    final url = Uri.parse('https://b55a-156-203-31-246.eu.ngrok.io/');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      setState(() {
        pred_text = obj['name'];
      });
    } else {
      throw Exception('Error!');
    }
  }

  Future _MethodpickVideoCamera() async {
    //_controllerCamera.hasListeners?
    pickedFile = await picker.pickVideo(source: ImageSource.camera,maxDuration: const Duration(seconds: 3),

    );

    _Video = File(pickedFile!.path);

    _controller = VideoPlayerController.file(_Video)
      ..initialize().then((_) {
        setState(() {});
        //_controller.play();
      });
  }

  Future _MethodpickVideoGallery() async {
    pickedFile = await picker.pickVideo(source: ImageSource.gallery,maxDuration: const Duration(seconds: 3));
    _Video = File(pickedFile!.path);
    _controller = VideoPlayerController.file(_Video)
      ..initialize().then((_) async {
        setState(() {});
        //_controller.play();
        //_uploadvideo();
        // sleep(const Duration(seconds: 3));
        //await _getText();
      });
  }

  @override
  void initState() {
    // TODO: implement initState
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
    //_controllerGallery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        color: Colors.black26,
        home: Scaffold(
          body: ListView(children: [
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
              padding: const EdgeInsets.only(left: 50, top: 5),
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
              padding: const EdgeInsets.only(left: 50, top: 5),
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
          ]),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
          floatingActionButton: SpeedDial(
            //Speed dial menu
            visible: true,
            icon: Icons.video_call_outlined,
            activeLabel: const Text("Close"),
            activeIcon: Icons.close,
            //icon when menu is expanded on button
            //backgroundColor: Colors.deepPurpleAccent, //background color of button
            //foregroundColor: Colors.white, //font color, icon color in button
            //activeBackgroundColor: Colors.deepPurpleAccent, //background color when menu is expanded
            //activeForegroundColor: Colors.white,
            closeManually: false,
            curve: Curves.bounceIn,
            overlayColor: Colors.black,
            overlayOpacity: 0.5,
            heroTag: "float",
            elevation: 8.0,
            //shadow elevation of button
            shape: const CircleBorder(),
            //shape of button
            children: [
              SpeedDialChild(
                child: const Icon(Icons.camera),
                //backgroundColor: theme.lightTheme?Colors.blue:Colors.blue,
                //foregroundColor: Colors.white,
                label: 'Camera',
                labelStyle: const TextStyle(fontSize: 18.0),
                onTap: () => _MethodpickVideoCamera(),
              ),
              SpeedDialChild(
                child: const Icon(Icons.drive_file_move),
                // foregroundColor: Colors.white,
                // backgroundColor: Colors.green,
                label: 'Gallery',
                labelStyle: const TextStyle(fontSize: 18.0),
                onTap: () => _MethodpickVideoGallery(),
              ),
            ],
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
                  child: Center(
                    child: controller.value.isPlaying?const Icon(
                      Icons.pause,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ):
                    Icon(
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

/*




 */
