import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/screens/previous_video.dart';
import 'package:text_of_silence_app0/screens/result_screen.dart';
import 'package:text_of_silence_app0/screens/carousel_screen.dart';
import 'package:text_of_silence_app0/screens/video_screen.dart';
import '../components/select_video_type.dart';
import '../controllers/Provider.dart';
import '../controllers/drawer.dart';
import '../theme/theme.dart';
import 'Home.dart';

class HomeScreenTOS extends StatefulWidget {
   const HomeScreenTOS({Key? key}) : super(key: key);

  @override
  _HomeScreenTOSState createState() => _HomeScreenTOSState();
}

class _HomeScreenTOSState extends State<HomeScreenTOS> {

  static int index =1;
  void  selectIndex(int i)
  {
    setState(() {
      index = i;
      // context.read<MyProvider>().setindex(index);
      Provider.of<MyProvider>(context,listen: false).setindex(i);
    });
  }
  static const List<Widget> pagesVedio = <Widget>[
    PreviousVideo(),SelectVideoType(),ResultScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) =>
            MaterialApp(
              color: theme.getTheme().backgroundColor,
              debugShowCheckedModeBanner: false,
              theme: theme.getTheme(),
              home: Scaffold(
                //backgroundColor: theme.getTheme()==theme.darkTheme?Colors.black26:Colors.white,
                //backgroundColor: theme.getTheme().backgroundColor,
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
                ),
                  body:pagesVedio.elementAt(index),
                  bottomNavigationBar: SizedBox(
                    height: 55,
                    child: BottomNavigationBar(
                      elevation: 0,

                      onTap: selectIndex,
                      currentIndex: index,
                      items: const <BottomNavigationBarItem>[

                       /* BottomNavigationBarItem(
                          icon: Icon(Icons.home),
                          label: 'home',
                        ),*/

                        BottomNavigationBarItem(
                          icon: Icon(Icons.explore),
                          label: ""
                        ),
                        BottomNavigationBarItem(
                          icon: Icon(Icons.home_filled),
                            label: ""
                        ),
                        BottomNavigationBarItem(

                          icon: Icon(Icons.translate),
                            label: ""
                        ),

                      ],
                    ),
                  ),
                  drawer:const DrawerClass(),
              ),

            )
    );
  }
}




