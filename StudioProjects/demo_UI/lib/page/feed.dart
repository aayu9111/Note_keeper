import 'package:flutter/material.dart';
import 'package:demo_ui/shoes.dart';
import 'package:demo_ui/model.dart';

class Feed extends StatefulWidget {
  const Feed({Key? key}) : super(key: key);

  @override
  State<Feed> createState() => _FeedState();
}

class _FeedState extends State<Feed> {
  List<Model> demo = [];
  List<Model> demo1 = [];

  @override
  void initState() {
    demo.add(
      Model('Air Max', '\$118', 'asset/images/th.jpg'),
    );
    demo.add(
      Model('Jordan Retro', '\$87', 'asset/images/this.jpg'),
    );
    demo.add(
      Model('NIKE', '\$899', 'asset/images/th.jpg'),
    );
    demo.add(
      Model('Retro Max', '\$78', 'asset/images/this.jpg'),
    );
    demo.add(
      Model('NIKE Air', '\$909', 'asset/images/th.jpg'),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: demo.length,
                itemBuilder: (context, index) => _itemBuilderWidget(index),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: demo.length,
                itemBuilder: (context, index) => _itemBuilderWidget(index),
              ),
            ),
          ],
        ),
      ),
      // ListView.builder(
      //     scrollDirection: Axis.vertical, itemCount: 5, itemBuilder: (context, index) => _itemBuilderWidget(index))
    );
  }

  _itemBuilderWidget(int index) {
    return CardItem(
      title: demo[index].title,
      subTitle: demo[index].subtitle,
      image: demo[index].image,
    );
  }
}
