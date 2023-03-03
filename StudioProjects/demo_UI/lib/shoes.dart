import 'package:flutter/material.dart';

class CardItem extends StatefulWidget {
  final String title;
  final String subTitle;
  final String image;
  const CardItem({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.image,
  }) : super(key: key);

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
        margin: EdgeInsets.all(10),
        height: 200,
        width: 200,
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image(
                  // image: AssetImage(widget.img),
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.image),
                ),
              ),
            ),
            // SizedBox(
            //   height: 10,
          ],
        ),
      ),
      Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          widget.title,
          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Text(
          widget.subTitle,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
            fontSize: 20,
          ),
        ),
      ])
    ]);
  }
}
