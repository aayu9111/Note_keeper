import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ui/receipe_screen.dart';
import 'package:food_ui/recipe_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text.dart' as values;
import 'category_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<List<Recipe>>? getCategory() async {
    final String response = await rootBundle.loadString("lib/category.json");
    final data = jsonDecode(response)["Category"] as List<dynamic>;
    print(data);
    return data.map((e) => Recipe.fromJson(e)).toList();
  }

  // Future<List<Recipe>>? getCategory1() async{
  //   final String response = await rootBundle.loadString("lib/category.json");
  //   final data = jsonDecode(response)["Category1"] as LIS
  // }
  // int add(int a , int b){
  //   var c = a+b;
  //   return c;
  // }

  List<Recipe>? recipeList;

  // List<Recipe> recipeList = [
  //   Recipe(
  //     img: 'assets/images/dumplings.png',
  //     recipeName: "Potstickers(Chinese Dumplings)",
  //     shortDescription: "An authentic potsticker recipe using ground beef and ground shrimp ",
  //     longDescription:
  //         "When the stew has about 30 mins to go, arrange the dumplings on top and cover with a lid. With the oven at 160C/140C fan/gas 3, cook the stew and dumplings for 20 mins, then remove the lid and cook for another 10 mins until they’re brown and puffed up.",
  //     difficultyLevel: "Easy",
  //     duration: "25 Min",
  //     ingredients: [
  //       CategoryModel()
  //         ..text = 'Shrimp'
  //         ..image = 'assets/images/shrimp.png'
  //         ..subtitle = '1 pound',
  //       CategoryModel()
  //         ..text = 'Beef'
  //         ..image = 'assets/images/beef.png'
  //         ..subtitle = '4 pound',
  //       CategoryModel()
  //         ..text = 'Ginger'
  //         ..image = 'assets/images/ginger.png'
  //         ..subtitle = '1 Root',
  //       CategoryModel()
  //         ..text = 'Soy sauce'
  //         ..image = 'assets/images/soy_sauce.png'
  //         ..subtitle = '2 table spoon'
  //     ],
  //   ),
  //   Recipe(
  //     img: 'assets/images/pasta.png',
  //     recipeName: "Pasta Coloured ",
  //     shortDescription: "A delicious dish created from fresh bounty of my garden  ",
  //     longDescription:
  //         "When the stew has about 30 mins to go, arrange the dumplings on top and cover with a lid. With the oven at 160C/140C fan/gas 3, cook the stew and dumplings for 20 mins, then remove the lid and cook for another 10 mins until they’re brown and puffed up.",
  //     difficultyLevel: "hard",
  //     duration: "20 Min",
  //     ingredients: [
  //       CategoryModel()
  //         ..text = 'Shrimp'
  //         ..image = 'assets/images/shrimp.png'
  //         ..subtitle = '1 pound',
  //       CategoryModel()
  //         ..text = 'Beef'
  //         ..image = 'assets/images/beef.png'
  //         ..subtitle = '4 pound',
  //       CategoryModel()
  //         ..text = 'Ginger'
  //         ..image = 'assets/images/ginger.png'
  //         ..subtitle = '1 Root',
  //       CategoryModel()
  //         ..text = 'Soy sauce'
  //         ..image = 'assets/images/soy_sauce.png'
  //         ..subtitle = '2 table spoon'
  //     ],
  //   ),
  // ];
  List<CategoryModel> card1 = [
    CategoryModel()
      ..image = 'assets/images/pizza.png'
      ..text = 'Pizza',
    CategoryModel()
      ..image = 'assets/images/pasta_category.png'
      ..text = 'Pasta',
    CategoryModel()
      ..image = 'assets/images/steak.png'
      ..text = 'Steak'
  ];
  List<CategoryModel> card2 = [
    CategoryModel()
      ..image = 'assets/images/popular.png'
      ..text = 'Masala Marinated Skirt Steak'
      ..subtitle =
          'Skirt Steak is always great on the grill and doesn\'t need much help,but I love how this came out...'
      ..iconImage = 'assets/icons/yellow_circle.png'
      ..text2 = '45min'
      ..iconImage2 = 'assets/icons/yellow_icon.png'
      ..text3 = 'Medium',
    CategoryModel()
      ..image = 'assets/images/popular.png'
      ..text = 'Masala Marinated Skirt Steak'
      ..subtitle =
          'Skirt Steak is always great on the grill and doesn\'t need much help,but I love how this came out...'
      ..iconImage = 'assets/icons/yellow_circle.png'
      ..text2 = '45min'
      ..iconImage2 = 'assets/icons/yellow_icon.png'
      ..text3 = 'Medium'
  ];

  @override
  void initState() {
    getRecipe();

    // int ans = add(5 , 10);
    super.initState();
  }

  void getRecipe() async {
    recipeList = await getCategory();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                SingleChildScrollView(
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 12),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              const ImageIcon(
                                  AssetImage(
                                    'assets/icons/menu.png',
                                  ),
                                  color: values.blue),
                              Wrap(
                                spacing: 22,
                                children: const [
                                  ImageIcon(AssetImage('assets/icons/search.png'), color: values.blue),
                                  ImageIcon(
                                    AssetImage('assets/icons/favourite.png'),
                                    color: values.blue,
                                  )
                                ],
                              ),
                            ]),
                        Text('Discover',
                            style: GoogleFonts.asar(
                                color: values.blue, fontSize: 40, fontWeight: FontWeight.w400, letterSpacing: 0)),
                        SizedBox(
                          height: 240,
                          child: recipeList == null
                              ? const SizedBox(
                                  height: 200,
                                )
                              : recipeCard(recipeList!),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Category',
                          style: values.text,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.110,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => categoryCard(card1[index]),
                              separatorBuilder: (context, index) => const SizedBox(
                                    width: 15,
                                  ),
                              itemCount: card1.length),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Popular Recipe',
                          style: values.text,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.62,
                            child: ListView.separated(
                              scrollDirection: Axis.vertical,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) => categoryCard2(card2[index]),
                              separatorBuilder: (context, index) => const SizedBox(
                                height: 15,
                              ),
                              itemCount: card2.length,
                            ))
                      ])),
                )
              ],
            )));
  }

  Widget recipeCard(List<Recipe> recipe) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:
          const BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/card_bg.png"))),
      child: Container(
        clipBehavior: Clip.none,
        child: CarouselSlider.builder(
            itemCount: recipeList!.length,
            itemBuilder: (context, index, realIndex) => GestureDetector(
                  onTap: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => RecipeScreen(recipe: recipe[index]))),
                  child: Stack(clipBehavior: Clip.none, children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Positioned(
                      left: 180,
                      bottom: 10,
                      child: Image.asset(
                        recipe[index].img,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      height: 300,
                      width: MediaQuery.of(context).size.width * 0.49,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipe[index].recipeName,
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Text(
                            recipe[index].shortDescription,
                            style: const TextStyle(color: Colors.grey, fontSize: 18),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Image.asset(
                                'assets/icons/yellow_circle.png',
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(recipe[index].duration, style: TextStyle(color: Colors.white)),
                              const SizedBox(
                                width: 15,
                              ),
                              Image.asset('assets/icons/yellow_icon.png'),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                recipe[index].difficultyLevel,
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              const SizedBox(
                                height: 4,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
            options: CarouselOptions(
              clipBehavior: Clip.none,
              viewportFraction: 1.8,
              aspectRatio: 9 / 16,
            )),
      ),
    );
  }

  Widget categoryCard(CategoryModel card1) {
    return Stack(
      children: [
        Image.asset(
          card1.image,
        ),
        Positioned(
          bottom: 15,
          left: 10,
          child: Text(
            card1.text,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  Widget categoryCard2(CategoryModel card2) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          fit: BoxFit.fitWidth,
          width: double.infinity,
          card2.image,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          card2.text,
          style: values.text,
        ),
        Text(
          card2.subtitle,
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(
          height: 8,
        ),
        Row(
          children: [
            ImageIcon(AssetImage(card2.iconImage)),
            const SizedBox(
              width: 5,
            ),
            Text(card2.text2),
            const SizedBox(
              width: 15,
            ),
            ImageIcon(AssetImage(card2.iconImage2)),
            const SizedBox(
              width: 5,
            ),
            Text(card2.text3)
          ],
        ),
      ],
    );
  }
}
