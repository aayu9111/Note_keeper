import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Screen1'),
      ),
      body: Center(
          child: FloatingActionButton.extended(
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(),
        onPressed: () {
          //Navigator.pop(context);
        },
        label: Text('screen1'),
      )),
    ));
  }
}
