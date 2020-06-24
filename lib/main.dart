import 'dart:ui';

import 'package:app/CameraScreen.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/* void main() {
  runApp(MyApp());
} */

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
  } on CameraException catch (e) {
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData(
          primaryColor: Color(0xFFFFBD73),
          scaffoldBackgroundColor: Color(0xFF181818),
          textTheme: TextTheme(
              display1: TextStyle(
                  color: Colors.white,
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold),
              button: TextStyle(color: Color(0xFFFFBD73)),
              headline: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.normal, fontSize: 16.0))),
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: <Widget>[
      Expanded(
        flex: 3,
        child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/card.png"), fit: BoxFit.cover))),
      ),
      Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
        RichText(
          textAlign: TextAlign.center,
            text: TextSpan(
         children: [
          TextSpan(
              text: "BUSINESS CARD\n",
              style: Theme.of(context).textTheme.display1),
              TextSpan(
                text: "Solutions For A Small Easy",
              style: Theme.of(context).textTheme.headline)
              
        ])),
        FittedBox(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                        return CameraScreen();
                        },
                      ));
                    },
                                      child: Container(
            margin: EdgeInsets.only(bottom: 25),
            padding: EdgeInsets.symmetric(horizontal:26,vertical:16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color:  Color(0xFFFFBD73),
            ),
            child: Row(
              children: <Widget>[
                Text("START",
                style: Theme.of(context).textTheme.button.copyWith(color: Colors.black)),
                SizedBox(width:10),
                Icon(Icons.arrow_forward,
                color: Colors.black,)
              ]
            ),
          ),
                  ),
        )
      ]))
    ]));
  }
}
