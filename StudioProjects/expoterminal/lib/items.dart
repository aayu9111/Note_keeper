import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Items extends StatefulWidget {
  final String image;
  final String text;
  const Items({Key? key, required this.image, required this.text}) : super(key: key);

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: AssetImage(widget.image),
              radius: 30,
            )),
        Text(
          widget.text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, fontFamily: 'CormorantGaramond'),
        )
      ],
    );
  }
}
