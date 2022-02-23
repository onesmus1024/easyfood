
import 'package:eazyfood/widgets/categories.dart';
import 'package:flutter/material.dart';
import '../widgets/foodcard.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: [
            Container(
              color: Theme.of(context).primaryColor.withOpacity(0.0),
              child:const  Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "KARU easy way to book your delicious meal",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
              width: 50,
              child: Category1(),
            )
            ,
            const Padding(padding: EdgeInsets.all(10),child:  Text("Todays Special",style: TextStyle(fontWeight: FontWeight.bold),)),
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
        );
  }
}
