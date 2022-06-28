import 'dart:io';

import 'package:flutter/material.dart';
import 'package:text_of_silence_app0/components/help_dialog.dart';

import '../screens/home_screen.dart';
class DrawerClass extends StatelessWidget {
  const DrawerClass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int _selectedDestination = 0;
    void selectDestination(int index) {
      /*  setState(() {
      _selectedDestination = index;
    });*/
    }
    return Drawer(

      backgroundColor: Colors.black54,
      elevation: 15,
      child: ListView(
        children:  [

          /*
          const Padding(
            padding: EdgeInsets.all(25),
            child: ListTile(
              textColor: Colors.white,
              title: Text('Text Of Silence'),
              subtitle: Text('TOS'),
              leading: Image(image: AssetImage('images/icon.jpg')),
            ),
          ),
          const Divider(color: Colors.amber,height: 5,thickness: 1),
          const SizedBox(height: 5,),
          ListTile(
            title: const Text('Title 1',),
            trailing: const Icon(Icons.navigate_next),
            leading: const Icon(Icons.navigate_next),
            selected: _selectedDestination == 1,
            onTap: () => selectDestination(1),
            textColor: Colors.white,
          ),
          const Divider(color: Colors.amber,height: 5,thickness: 1),
          const SizedBox(height: 5,),
          ListTile(
            title: const Text('Title 1',),
            trailing: const Icon(Icons.navigate_next),
            leading: const Icon(Icons.navigate_next),
            selected: _selectedDestination == 1,
            onTap: () => selectDestination(1),
            textColor: Colors.white,
          ),
          const Divider(color: Colors.amber,height: 5,thickness: 1),
          const SizedBox(height: 5,),
          ListTile(
            title: const Text('Title 1',),
            trailing: const Icon(Icons.navigate_next),
            leading: const Icon(Icons.navigate_next),
            selected: _selectedDestination == 2,
            onTap: () => selectDestination(2),
            textColor: Colors.white,
          ),
          const Divider(color: Colors.amber,height: 5,thickness: 1),
          const SizedBox(height: 5,),
          ListTile(
            title: const Text('Title 1',),
            trailing: const Icon(Icons.navigate_next),
            leading: const Icon(Icons.navigate_next),
            selected: _selectedDestination == 3,
            onTap: (){
              selectDestination(3);
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) =>  const HelpDialog()));
            },textColor: Colors.white,
          ),

          const Divider(color: Colors.amber,height: 5,thickness: 1),
          const SizedBox( height: kToolbarHeight,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Expanded(child: Align(
                alignment: FractionalOffset.center,
                child: FloatingActionButton(
                    heroTag: "btn1",
                    child: const Icon(Icons.home),
                    onPressed: (){
                       //Navigator.push(context, HomeScreen());
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) =>  const HomeScreenTOS()),
                     );
                    }),
              ),
              ),
              Expanded(child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: FloatingActionButton(
                    heroTag: "btn2",
                    child: const Icon(Icons.logout),
                    onPressed: (){
                       exit(1);
                    }),

              ),
              ),

            ],
          ),
*/
        ],
      ),

    );

  }
}
