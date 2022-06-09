import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_of_silence_app0/theme/theme.dart';
import 'package:translator/translator.dart';

import '../components/select_video_type.dart';
import '../controllers/Provider.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final _formKey = GlobalKey<FormState>();
  GoogleTranslator translator = GoogleTranslator(); //using google translator
  String out = "";
  static String CopyText ="";
  var pred_text = TextEditingController();
  late var pred_text_Arb = TextEditingController(text: out) ; //getting text
  void translatorMethod() {
    translator.translate(pred_text.text, to: 'ar').then((output) {
      setState(() {
        out = output.text;
        pred_text_Arb = TextEditingController(text: out);
      });
      print(out);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    pred_text.text = Provider.of<MyProvider>(context,listen: false).Pred_Text_method;
    //pred_text.text =CopyText;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: Scaffold(
            body: Center(
              child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        maxLines: null,
                        //keyboardType: TextInputType.multiline,
                        readOnly: true,
                        decoration: InputDecoration(
                            suffix: IconButton(
                              onPressed: () {
                                setState(() {
                                  translatorMethod();

                                });
                              },
                              icon: const Icon(Icons.translate_sharp),
                            ),
                            hintText: "Input your text",
                            border: const OutlineInputBorder(borderRadius:
                                    BorderRadius.all(Radius.circular(10))),),
                        textAlign: TextAlign.justify,
                        controller: pred_text,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty value";
                          }
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          suffix: IconButton(
                            onPressed: () {
                              //translatorMethod();
                            },
                            icon: const Icon(Icons.copy),
                          ),
                          hintText: "Translation here",
                          border: const OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(10))),),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          //color: Colors.white,
                          fontSize: 25.0,
                        ),
                        controller: pred_text_Arb,
                        readOnly: true,

                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty value";
                          }
                        },
                      ),
                    ),
                  )
                ],
                ),
              ),
            )),
      ),
    );
  }
}
