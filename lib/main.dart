import 'package:flutter/material.dart';
import 'player.dart';
import 'player_chewie.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Video List"),
      ),
      body: Column(children: <Widget>[
        RaisedButton(
          child: Text("Open Player"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoApp()),
            );
          },
        ),
        RaisedButton(
          child: Text("Open Chewie Player"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoAppChewie()),
            );
          },
        )
      ]),
    );
  }
}
