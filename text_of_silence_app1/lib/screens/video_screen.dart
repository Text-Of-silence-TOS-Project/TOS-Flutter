/*
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../theme/theme.dart';

late int Indexvideocolor = 1;
late String pred_text = "ss";

class VideoScreen extends StatefulWidget {
  const VideoScreen({Key? key}) : super(key: key);
  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen>
    with SingleTickerProviderStateMixin {
  late VideoPlayerController _controllerCamera;
  late VideoPlayerController _controllerGallery;
  late File _Video = File('tos.mp4');
  late final picker = ImagePicker();
  late final videodete;

  /*
  void _openFileExplorer() async {
    _files = (await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
        allowedExtensions: null
    ))!.files;
  }

   */
  Future _MethodpickVideoCamera() async {
    final XFile? pickedFile =
    await picker.pickVideo(source: ImageSource.camera);
    _Video = File(pickedFile!.path);
    _controllerCamera = VideoPlayerController.file(_Video)
      ..initialize().then((_) {
        setState(() {});
        _controllerCamera.play();
      });
  }
  Future _MethodpickVideoGallery() async {
    final XFile? pickedFile =
        await picker.pickVideo(source: ImageSource.gallery);
    _Video = File(pickedFile!.path);
    _controllerGallery = VideoPlayerController.file(_Video)
      ..initialize().then((_) {
        setState(() {});
        _controllerGallery.play();
      });
  }

  void _uploadvideo() async {
    var url = Uri.parse('https://b55a-156-203-31-246.eu.ngrok.io/');
    var request = http.MultipartRequest('POST',url);
    request.files.add(await http.MultipartFile.fromPath('file', _Video.path));
    var response = await request.send();
    if (response.statusCode==200) {
      // ignore: avoid_print
      print("Uploaded successfully ");
    }
    else{
      // ignore: avoid_print
      print("Loaded file path is ... ");
    }
  }
  _getText() async{
    final url = Uri.parse('https://b55a-156-203-31-246.eu.ngrok.io/');
    final res = await http.get(url);
    if(res.statusCode == 200){
      var obj = json.decode(res.body);
      setState(() {
        pred_text=obj['name'];
      });

    }
    else {
      throw Exception('Error!');
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    _controllerCamera = VideoPlayerController.asset('video/tos.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    _controllerGallery = VideoPlayerController.asset('video/tos.mp4')
      ..initialize().then((_) {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controllerCamera.dispose();
    _controllerGallery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
          theme: theme.getTheme(),
          home:DefaultTabController(
            length: 2,
            child: Scaffold(
              key: const ValueKey<String>('home_page'),
              appBar: AppBar(
                title: const Text('Text Of Silence'),
                centerTitle: true,
                actions: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          if(theme.getTheme()==theme.darkTheme) {
                            theme.setLightMode();
                          }
                          else
                          {
                            theme.setDarkMode();
                          }
                        });
                      }, icon: (theme.getTheme()==theme.darkTheme)?const Icon(Icons.wb_sunny_outlined):
                  const Icon(Icons.nightlight_round)
                  ),
                ],
                bottom: const TabBar(
                  isScrollable: true,
                  //unselectedLabelColor: Colors.white38,
                  //labelColor: Colors.white70,
                  //indicatorColor: Colors.white,
                  tabs: <Widget>[
                    Tab(icon: Icon(Icons.create_new_folder), text: 'Gallery'),
                    Tab(icon: Icon(Icons.camera_alt_outlined,), text: 'Camera',),

                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  ListView(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.only(top: 20.0),
                          ),
                          const Text('With Gallery mp4'),
                          const SizedBox(
                            height: 10,
                          ),
                          FloatingActionButton.extended(
                            icon:
                            const Icon(Icons.video_call_outlined, size: 15,),
                            onPressed: (){
                              setState(() {
                                _MethodpickVideoGallery();
                              });
                            }, label: const Text("Open Gallery"),
                          ),
                          Container(
                            height: 300,
                            width: 250,
                            padding: const EdgeInsets.all(20),
                            child: AspectRatio(
                              aspectRatio: _controllerGallery.value.aspectRatio,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  VideoPlayer(_controllerGallery),
                                  _ControlsOverlay(controller: _controllerGallery),
                                  ClosedCaption(
                                      text: _controllerGallery.value.caption.text),
                                  VideoProgressIndicator(_controllerGallery,
                                      allowScrubbing: true),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          FloatingActionButton.extended(
                            elevation: 4.0,
                            heroTag: "btn6",
                            icon: const Icon(
                              Icons.title,
                            ),
                            onPressed: () async {
                              _uploadvideo();
                             // sleep(const Duration(seconds: 3));
                             await _getText();
                            }, label:
                          const Text("Get Text",style: TextStyle(fontSize: 10,),),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Divider(
                            height: 50,
                            color: Colors.teal,
                          ),
                          Text(_Video.toString()),
                          const Divider(
                            height: 5,
                            color: Colors.teal,
                          ),
                        ],
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      Column(
                        children: <Widget>[
                          Container(padding: const EdgeInsets.only(top: 20.0)),
                          const Text('With Camera mp4'),
                          const SizedBox(
                            height: 10,
                          ),
                          FloatingActionButton.extended(
                            icon:
                            const Icon(Icons.video_call_outlined, size: 15,),
                            onPressed: (){
                              setState(() {
                                _MethodpickVideoCamera();
                              });
                            }, label: const Text("Open Camera"),
                          ),
                          Container(
                            height: 300,
                            width: 250,
                            padding: const EdgeInsets.all(20),
                            child: AspectRatio(
                              aspectRatio: _controllerCamera.value.aspectRatio,
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: <Widget>[
                                  VideoPlayer(_controllerCamera),
                                  ClosedCaption(
                                      text: _controllerCamera.value.caption.text),
                                  _ControlsOverlay(controller: _controllerCamera),
                                  VideoProgressIndicator(_controllerCamera,
                                      allowScrubbing: true),
                                ],
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 10,
                          ),
                          FloatingActionButton.extended(
                            elevation: 4.0,
                            heroTag: "btn6",
                            icon: const Icon(
                              Icons.title,
                            ),
                            onPressed: () async {
                              _uploadvideo();
                              sleep(const Duration(seconds: 3));
                              _getText();
                            }, label:
                          const Text("Get Text",style: TextStyle(fontSize: 10,),),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          const Divider(
                            height: 50,
                            color: Colors.teal,
                          ),
                          Text(_Video.toString())
                        ],
                      ),

                    ],
                  )
                ],
              ),

              ),
            ),
      ),
    );

  }
}
//--------------------------------------------------------------

//--------------------------------------------------------------
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
//--------------------------------------------------------------
class Video {
  final String Video_title;
  const Video({ required this.Video_title});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      Video_title: json['Video_title'],
    );
  }
}

 */