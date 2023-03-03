import 'package:flutter/material.dart';
import 'package:food_ui/dashboard_screen.dart';
import 'package:food_ui/recipe_model.dart';
import 'package:food_ui/text.dart' as values;
import 'category_model.dart';

class RecipeScreen extends StatefulWidget {
  final Recipe recipe;
  const RecipeScreen({
    Key? key,
    required this.recipe,
  }) : super(key: key);

  @override
  State<RecipeScreen> createState() => _RecipeScreenState();
}

class _RecipeScreenState extends State<RecipeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Stack(
          children: [
            Image.asset(
              width: double.infinity,
              fit: BoxFit.cover,
              'assets/images/recipe_bg.png',
            ),
            Positioned.fill(
              child: Image.asset(widget.recipe.img),
            ),
            Positioned(
                top: 50,
                left: 20,
                child: GestureDetector(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DashboardScreen())),
                  child: const ImageIcon(
                    AssetImage(
                      'assets/icons/arrow_back.png',
                    ),
                    color: Colors.white,
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.recipe.recipeName,
                style: values.text,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                widget.recipe.longDescription,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Image.asset(
                    'assets/icons/yellow_circle.png',
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.recipe.duration),
                  const SizedBox(
                    width: 15,
                  ),
                  Image.asset('assets/icons/yellow_icon.png'),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(widget.recipe.difficultyLevel),
                  const SizedBox(
                    width: 15,
                  ),
                  const SizedBox(
                    height: 4,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                'Ingredients',
                style: values.text,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ingredientsCard(widget.recipe.ingredients, index),
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 5,
                  ),
                  itemCount: widget.recipe.ingredients.length,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Recipe',
                style: values.text,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                widget.recipe.shortDescription,
                style: const TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        )
      ]),
    ));
  }
}

Widget ingredientsCard(List<CategoryModel> ingredients, int index) {
  return Stack(
    alignment: Alignment.bottomCenter,
    children: [
      Image.asset(ingredients[index].image),
      Positioned(
        bottom: 15,
        child: Text(
          ingredients[index].text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      Text(
        ingredients[index].subtitle,
        style: const TextStyle(color: Colors.grey),
      )
    ],
  );
}
