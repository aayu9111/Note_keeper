import 'package:flutter/material.dart';

class Container extends StatefulWidget {
  const Container(
      {Key? key,
      required EdgeInsets margin,
      required int height,
      required int width,
      required BoxDecoration decoration})
      : super(key: key);

  @override
  State<Container> createState() => _ContainerState();
}

class _ContainerSState extends State<Container> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      height: 200,
      width: 170,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xFF1D1E33)),
    );
  }
}
