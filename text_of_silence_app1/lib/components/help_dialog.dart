import 'package:flutter/material.dart';

import '../screens/home_screen.dart';

class HelpDialog extends StatelessWidget {
  const HelpDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(

      title: Row(
        children: const <Widget>[
          Icon(Icons.help_outline),
          Text(' Help'),
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 5,
          ),

        ],
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: const <Widget>[

            Text(
                'Your sentence structure = Command + Color + Preposition + Letter + Digit + Adverb   .\n\n'),
            Text('Command category words: \n • bin • lay • place • set\n'),
            Text('Color category words: \n • blue • green • red\n • white\n'),
            Text('Preposition category words: \n • at • by • in • with\n'),
            Text('Letter category words: \n • A to Z\n'),
            Text('Digit category words: \n • 0 to 9\n'),
            Text('Adverb category words: \n • again • now • please • soon\n'),
          ],
        ),
      ),
      backgroundColor: Colors.grey,
      actions: <Widget>[
        FlatButton(
          child: const Text('OK',style: TextStyle(fontSize: 25,color: Colors.black),),
          onPressed: () {
            //Navigator.of(context).pop();
           Navigator.pushReplacement(context,
           MaterialPageRoute(builder: (context) =>  const HomeScreenTOS()));
    }
        ),
      ],
    );
  }
}
