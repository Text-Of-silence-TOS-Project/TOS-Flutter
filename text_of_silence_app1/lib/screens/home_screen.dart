
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/screens/previous_video.dart';
import 'package:text_of_silence_app0/screens/result_screen.dart';
import 'select_video_type.dart';
import '../controllers/Provider.dart';
import '../controllers/drawer.dart';
import '../theme/theme.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class HomeScreenTOS extends StatefulWidget {
   const HomeScreenTOS({Key? key}) : super(key: key);

  @override
  _HomeScreenTOSState createState() => _HomeScreenTOSState();
}

class _HomeScreenTOSState extends State<HomeScreenTOS> {
  late List _pages;
  int _selectedPageIndex = 1;
  final items = <Widget>[
    const Icon(Icons.explore,color: Colors.white,),
    const Icon(Icons.home,color: Colors.white,),
    const Icon(Icons.translate,color: Colors.white,)
  ];
  void selectedItem(int value) {
    setState(() {
      _selectedPageIndex = value;
    });
  }
  var light = ThemeNotifier().light?true:false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<MyProvider>(context,listen: false).set_pickVidoe(false);
    light = ThemeNotifier().light?true:false;
    _pages = [
      {
        'page': PreviousVideo(),
      },
      {
        'page': SelectVideoType(),
      },

      {
        'page': ResultScreen(),
      }
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
        builder: (context, theme, child) =>
            MaterialApp(
              color: theme.getTheme().backgroundColor,
              debugShowCheckedModeBanner: false,
              theme: theme.getTheme(),
              home: Scaffold(
                appBar: AppBar(
                  title: const Text('Text Of Silence'),
                  centerTitle: true,
                  actions: [
                    IconButton(
                        onPressed: () {
                          setState(() {
                            if(theme.getTheme()==theme.darkTheme) {
                              theme.setLightMode();
                              light = true;
                            }
                            else
                            {
                              theme.setDarkMode();
                              light = false;
                            }
                          });
                        }, icon: (theme.getTheme()==theme.darkTheme)?const Icon(Icons.wb_sunny_outlined):
                    const Icon(Icons.nightlight_round)
                    ),
                  ],
                  leading: IconButton(
                    onPressed: (){
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              elevation: 10,
                              child: Container(
                                height: 450.0,
                                width: 360.0,
                                child: ListView(
                                  children:  <Widget>[
                                    const SizedBox(height: 10,),
                                    const Text(
                                        ' Your sentence structure = Command + Color + Preposition + Letter + Digit + Adverb   .\n\n'),
                                    const Text(' 1. Command category words: \n • bin • lay • place • set\n'),
                                    const Text(' 2. Color category words: \n • blue • green • red\n • white\n'),
                                    const Text(' 3. Preposition category words: \n • at • by • in • with\n'),
                                    const Text(' 4. Letter category words: \n • A to Z\n'),
                                    const Text(' 5. Digit category words: \n • 0 to 9\n'),
                                    const Text(' 6. Adverb category words: \n • again • now • please • soon\n'),
                                    FlatButton(
                                        child: const Text('OK',style: TextStyle(fontSize: 25,color: Colors.black,),),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                         /* Navigator.pushReplacement(context,
                                              MaterialPageRoute(builder: (context) =>  const HomeScreenTOS()));*/
                                        }
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      });
                    }, icon: Icon(Icons.help_outline),
                  ),
                ),
                body: _pages[_selectedPageIndex]['page'],
                bottomNavigationBar: Theme(
                  data: theme.getTheme(),
                  child: Consumer<ThemeNotifier>(
                    builder: (context, theme, child) => Theme(
                      data: theme.getTheme(),
                      child: CurvedNavigationBar(
                      items: items,
                      height: 60,
                     buttonBackgroundColor: theme.getTheme()==theme.lightTheme?const Color.fromRGBO(82, 32, 96, 1):Colors.black,
                      backgroundColor: Colors.transparent,
                     color: theme.getTheme()==theme.lightTheme?const Color.fromRGBO(82, 32, 96, 1):Colors.black,
                      index: _selectedPageIndex,
                      onTap: selectedItem,
                      animationDuration: const Duration(milliseconds: 700),
                  ),
                    ),
                ),
                ),
                 // drawer:const DrawerClass(),
              ),

            )
    );
  }
}




