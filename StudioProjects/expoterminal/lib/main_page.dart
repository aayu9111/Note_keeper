import 'package:carousel_slider/carousel_slider.dart';
import 'package:expoterminal/items.dart';
import 'package:expoterminal/services_model.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:expoterminal/colors.dart' as values;

import 'colors.dart';
import 'model.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<String> imageList = [
    'asset/images/footwea.jpg',
    // 'asset/images/grocery.webp',
    'asset/images/makeup.jpeg',
    'asset/images/stationary.jpeg'
  ];

  List<Model> image = [];

  @override
  void initState() {
    image.add(Model('Makeup', 'asset/images/makeup.jpeg'));
    image.add(Model('Shoes', 'asset/images/footwea.jpg'));
    image.add(Model('Shoes', 'asset/images/footwea.jpg'));
    image.add(Model('Books', 'asset/images/stationary.jpeg'));
    image.add(Model('food', 'asset/images/makeup.jpeg'));
    image.add(Model('Bevreges', 'asset/images/stationary.jpeg'));
    image.add(Model('Bevreges', 'asset/images/stationary.jpeg'));
    print("product" + product.length.toString());
    super.initState();
  }

  List<ServiceModel> services = [
    ServiceModel()
      ..title = 'International logistics'
      ..subtitle = 'We enable your trade journey : shipping , warehousing and delivery'
      ..icon = const Icon(Icons.add_chart_rounded),
    ServiceModel()
      ..title = 'Become a Manufacturer'
      ..subtitle = 'Expand your business across 7+ Countries and Grow your Business'
      ..icon = const Icon(Icons.precision_manufacturing_rounded),
    ServiceModel()
      ..title = 'Customize Products'
      ..subtitle = 'Now wish for Customize product more easily at the best Price.'
      ..icon = const Icon(Icons.dashboard_customize_outlined)
  ];

  List<ServiceModel> product = [
    ServiceModel()
      ..title = 'Cool Berg'
      ..image = 'asset/images/coolberg.jpg'
      ..subtitle = 'USD -(10.53/Box)',
    ServiceModel()
      ..title = 'Carls Berg'
      ..image = 'asset/images/carlsberg.png'
      ..subtitle = 'USD -(10.53/Box)',
    ServiceModel()
      ..title = 'Breezer'
      ..image = 'asset/images/breezer.jpeg'
      ..subtitle = 'USD -(10.53/Box)'
  ];

  List<ServiceModel> category = [
    ServiceModel()
      ..image = 'asset/images/footwea.jpg'
      ..subtitle = 'FootWear',
    ServiceModel()
      ..image = 'asset/images/hi.png'
      ..subtitle = 'Dresses',
    ServiceModel()
      ..image = 'asset/images/swiggy.jpeg'
      ..subtitle = 'Grocery',
    ServiceModel()
      ..image = 'asset/images/shop.jpeg'
      ..subtitle = 'OnlineShop'
  ];
  final controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 10),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * 0.78,
                                margin: const EdgeInsets.all(12),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(borderSide: BorderSide()),
                                    focusedBorder:
                                        const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                    hintText: 'Search Here...',
                                    prefixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.search,
                                        color: Colors.black,
                                        size: 32,
                                      ),
                                      onPressed: () {},
                                    ),
                                    suffixIcon: IconButton(
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.black,
                                      ),
                                      onPressed: () {},
                                    ),
                                    // enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
                                  ),
                                )),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.add_chart,
                                  color: Colors.black,
                                  size: 30,
                                ))
                          ],
                        ),
                        const Divider(
                          thickness: 0.55,
                          color: Colors.grey,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CarouselSlider.builder(
                          itemBuilder: (context, index, realIndex) {
                            return Container(
                              color: Colors.grey,
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              // margin: EdgeInsets.all(),
                              child: Image.asset(imageList[index], fit: BoxFit.fill),
                            );
                          },
                          itemCount: imageList.length,
                          options: CarouselOptions(
                            enlargeCenterPage: true,
                            autoPlay: true,

                            // reverse: true,
                          ),
                        ),

                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Categories',
                          style: TextStyle(fontSize: 28, fontFamily: 'CormorantGaramond', fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Items(
                                image: image[index].image,
                                text: image[index].text,
                              );
                            },
                            itemCount: image.length,
                          ),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text('Our Services',
                            style:
                                TextStyle(fontFamily: 'CormorantGaramond', fontSize: 28, fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        // SingleChildScrollView(
                        //   child:
                        SizedBox(
                          height: 150,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 10,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: 3,
                            itemBuilder: (context, index) => serviceCard(services[index]),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'New Arrivals',
                              style: values.text,
                            ),
                            // Text(
                            //   'See More',
                            //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                            // ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.42,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => const SizedBox(
                              width: 15,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemCount: product.length,
                            itemBuilder: (context, index) => productCard(product[index]),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.044,
                          child: const Text(
                            'Top Categories',
                            style: values.text,
                          ),
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.45,
                            child: GridView.builder(
                              itemBuilder: (context, index) => (categoryCard(category[index])),
                              itemCount: category.length,
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              ),
                            )),
                        const SizedBox(height: 80)
                      ]),
                ),
              ),
              Positioned(
                bottom: 5,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: FloatingNavbar(
                    onTap: (int val) {},
                    currentIndex: 0,
                    items: [
                      FloatingNavbarItem(icon: Icons.home, title: 'Home'),
                      FloatingNavbarItem(icon: Icons.explore, title: 'Explore'),
                      FloatingNavbarItem(icon: Icons.shopping_cart_outlined, title: 'Cart'),
                      FloatingNavbarItem(icon: Icons.account_circle, title: 'Account'),
                    ],
                  ),
                ),
              ),
            ])));
  }

  Widget serviceCard(ServiceModel service) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black12)),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(children: [
                  service.icon!,
                  const SizedBox(
                    width: 7,
                  ),
                  Text(
                    service.title,
                    // maxLines: 1,
                    // softWrap: true,
                    // overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontFamily: 'CormorantGaramond',
                        color: values.Blue2,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                service.subtitle,
                style: const TextStyle(fontSize: 15),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text(
                    'Learn More',
                    style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'CormorantGaramond', fontSize: 20),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget productCard(ServiceModel product) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width * 0.43,
      // height: MediaQuery.of(context).size.height * 0.35,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.title,
            style: const TextStyle(
                fontSize: 30, color: Colors.pink, fontWeight: FontWeight.w600, fontFamily: 'CormorantGaramond'),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
              alignment: Alignment.center,
              child: Image.asset(
                product.image,
                height: 200,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 20,
          ),
          Text(product.subtitle,
              style: const TextStyle(
                  color: Colors.orange, fontWeight: FontWeight.w600, fontSize: 20, fontFamily: 'CormorantGaramond')),
        ],
      ),
    );
    // }
  }
}

Widget categoryCard(ServiceModel category) {
  return Card(
      // color: Colors.black12,
      child: Column(
    children: [
      Flexible(
        flex: 1,
        fit: FlexFit.tight,
        child: Image.asset(
          category.image,
          // fit: BoxFit.fill,
        ),
      ),
      Text(
        category.subtitle,
        style: values.text,
      )
    ],
  ));
}
