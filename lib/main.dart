import 'package:eazyfood/widgets/categories.dart';
import 'package:eazyfood/widgets/foodcard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        primaryColor: Colors.purple,
        textTheme: const TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold),
          headline5: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      home: Scaffold(
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 0, top: 20),
              child: Align(
                alignment: Alignment.topRight,
                child: Icon(Icons.star),
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.0),
              child: const Text(
                "KARU easy way to book your\n delicious meal to avoid upsets",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  Category(
                    category: "All",
                  ),
                  Category(category: "Pizza"),
                  Category(category: "Romagna"),
                  Category(category: "Madd max"),
                  Category(category: "Tomato soup"),
                  Category(category: "Star fried vegetables")
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  FoodCard(
                      imageUrl:
                          "https://media.istockphoto.com/photos/take-out-pizza-in-a-box-picture-id1134570374?b=1&k=20&m=1134570374&s=170667a&w=0&h=A6nt9VKDm8nefj2TGqLYejaTU87cKCgMp0jHt_RATlE=",
                      price: 300,
                      type: "tomato soup",
                      subHeading: "fresh and natural",
                      description:
                          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
                  FoodCard(
                      imageUrl:
                          "https://media.istockphoto.com/photos/cannabis-food-withpizza-on-wooden-tray-and-chilli-basil-leaf-top-view-picture-id1155333183?k=20&m=1155333183&s=612x612&w=0&h=93LKF9kiiVTvcJvXHj-BAYvpxz7wjQ-2qZSt_mECzdw=",
                      price: 300,
                      type: "kenyan pizza",
                      subHeading: "fresh and natural",
                      description:
                          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
                  FoodCard(
                      imageUrl:
                          "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
                      price: 300,
                      type: "madd max",
                      subHeading: "fresh and natural",
                      description:
                          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."
                          ),
                          FoodCard(
                      imageUrl:
                          "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
                      price: 300,
                      type: "madd max",
                      subHeading: "fresh and natural",
                      description:
                          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."
                          ),
                          FoodCard(
                      imageUrl:
                          "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
                      price: 300,
                      type: "madd max",
                      subHeading: "fresh and natural",
                      description:
                          "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."
                          )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
