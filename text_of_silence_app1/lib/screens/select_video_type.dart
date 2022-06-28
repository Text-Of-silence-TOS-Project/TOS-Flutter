import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../controllers/Provider.dart';
import '../theme/theme.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'home_screen.dart';

class SelectVideoType extends StatefulWidget {

  const SelectVideoType({Key? key}) : super(key: key);


  @override
  _SelectVideoTypeState createState() => _SelectVideoTypeState();
}
 late String pred_text = "set white at b six now";
class _SelectVideoTypeState extends State<SelectVideoType> {
  late VideoPlayerController _controller;
  var visible_text = false;
  var Upload_video = false;
  var pick_video ;
  var showText = false;
  late File _Video = File('tos.mp4');
  late ImagePicker picker = ImagePicker();
  late final videodete;
  late String pred_text = "";
  var visible = true;
  late XFile? pickedFile;

  Future _MethodpickVideoCamera() async {
    //_controllerCamera.hasListeners?
    pickedFile = await picker.pickVideo(source: ImageSource.camera,maxDuration: const Duration(seconds: 3),

    );
    _Video = File(pickedFile!.path);
    _controller = VideoPlayerController.file(_Video)
      ..initialize().then((_) async {
        setState(() {});
        pick_video =  true;
      });
    pick_video = Provider.of<MyProvider>(context,listen: false).set_pickVidoe(true);
    _uploadvideo();
  }
  Future _MethodpickVideoGallery() async {
    pickedFile = await picker.pickVideo(source: ImageSource.gallery,maxDuration: const Duration(seconds: 3),);
    _Video = File(pickedFile!.path);
    _controller = VideoPlayerController.file(_Video)
      ..initialize().then((_) async {
        setState(() {
          //pick_video = Provider.of<MyProvider>(context,listen: false).set_pickVidoe(true);
          pick_video = true;
        });
         _uploadvideo();

      });

  }

_uploadvideo() async {
    var url = Uri.parse('https://f131-196-151-15-111.eu.ngrok.io/');
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', pickedFile!.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      // ignore: avoid_print

      Upload_video = true;
      _getText();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Uploaded successfully'),
      ));

      print("Uploaded successfully ");
    } else {
      // ignore: avoid_print
      print("Loaded file path is ... ");
    }
    setState(() {

    });
  }
_getText() async {
    final url = Uri.parse('https://f131-196-151-15-111.eu.ngrok.io/');
    final res = await http.get(url);
    if (res.statusCode == 200) {
      var obj = json.decode(res.body);
      setState(() {
        pred_text = obj['name'];
        showText = true;
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(' successfully'),
        ));

      });
    } else {
      throw Exception('Error!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
        _controller = VideoPlayerController.asset('assets/waitgirl.json')
          ..initialize().then((_) async {
            setState(() {});
          });

    super.initState();


    showText= false;
    pick_video =false;
    //Upload_video = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    //_controllerGallery.dispose();
    super.dispose();
    pick_video= false;
    showText = false;
    //pick_video =false;

  }

  @override
  Widget build(BuildContext context) {
    //pick_video = Provider.of<MyProvider>(context,listen: false).pick_vidoe;
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        //color: Colors.black26,
        home: Scaffold(
          //backgroundColor: Color.fromRGBO(227, 218, 225, 1),
          body: Container(
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                pick_video?
                Container(
              height: 350,
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
            )
                :Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Lottie.asset('assets/waitgirl.json', height: 300, width: 300),
                      const Text("Waiting for your video",
                          style: TextStyle(
                              color: Color.fromRGBO(144, 52, 153, 1), fontSize: 17))
                    ],
                  ),
                ),
                const Divider(height: 5,),
                pick_video?
                Column(
                  children: [
                    showText?
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
                    ):
                    Container(
                      child: Column(
                        children:  [
                          const CircularProgressIndicator(),
                          const SizedBox(height: 5,),
                          Upload_video==false?
                          const Text("Uploading the video"):
                          const Text("Uploaded the video"),
                          const SizedBox(height: 5,),
                          Upload_video == true && showText==false?
                          const Text("Getting The Text"):
                          const Text(""),

                        ],
                      ),
                    )
                  ],
                ):Container(),
                // below code button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: SizedBox(
                    width: 300, // <-- match_parent
                    height: 50, // <-- match-parent
                    child: ElevatedButton(
                      onPressed: () {
                        showMaterialModalBottomSheet(
                          context: context,
                          builder: (context) => Container (
                            height: 150,
                            width: 300,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Lottie.asset('assets/gallery2.json',
                                          height: 100, width: 100),
                                      SizedBox(
                                        width: 100, // <-- match_parent
                                        height: 30, // <-- match-parent
                                        child: ElevatedButton (
                                          onPressed: () async  {
                                            _MethodpickVideoGallery();
                                            setState(() async {
                                              pick_video?pred_text = "":pred_text=pred_text;
                                             // pick_video? _uploadvideo():null;
                                            });
                                          },
                                          child: const Text(
                                            "Gallery",
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  183, 103, 160, 1),
                                              onPrimary: Colors.white,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(25)))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Lottie.asset('assets/bestcamera.json',
                                          height: 100, width: 100),
                                      SizedBox(
                                        width: 100, // <-- match_parent
                                        height: 30, // <-- match-parent
                                        child: ElevatedButton(
                                          onPressed: () {
                                            _MethodpickVideoCamera();
                                            setState(() {
                                              Upload_video?pred_text = "":null;
                                              Upload_video? _uploadvideo():null;
                                            });
                                          },
                                          child: const Text(
                                            "Camera",
                                          ),
                                          style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  183, 103, 160, 1),
                                              onPrimary: Colors.white,
                                              shape: const RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.all(
                                                      Radius.circular(25)))),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: const Text("Upload video",
                          style: TextStyle(fontSize: 19)),
                      style: ElevatedButton.styleFrom(
                          primary: theme.getTheme()==theme.lightTheme?const Color.fromRGBO(82, 32, 96, 30):Colors.black54,
                          onPrimary: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)))),
                    ),
                  ),
                ),

              ],
            ),
          ),
        /* floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          floatingActionButton: SpeedDial(
            //Speed dial menu
            visible: true,
            icon: Icons.video_call_outlined,
            activeLabel: const Text("Close"),
            activeIcon: Icons.close,
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
          ),*/
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
          child:  controller.value.isPlaying
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
                    const Icon(
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
