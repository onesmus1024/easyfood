import 'dart:convert';

import 'package:eazyfood/models/product.dart';
import 'package:flutter/foundation.dart';
import '../models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  var url = Uri.parse(
      "https://eazyfood-3844b-default-rtdb.firebaseio.com/Product.json");
  List<Product> _items = [];
  List<Product> _filtered = [];


  Future<void> fetchProduct2(String category) async {
    List<Product> productList = [];
    if (category.toLowerCase() == "all") {
      productList = _filtered.where((element) => true).toList();
    }else{
      productList = _filtered
        .where((element) => element.type.toLowerCase() == category)
        .toList();
    }
    _items = productList;
    notifyListeners();
  }

  List<Product> get getProducts {
    return [..._items];
  }

  Future<void> fetchProduct() async {
    List<Product> productList = [];
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var productData = json.decode(response.body) as Map<String, dynamic>;
      productData.forEach((key, value) => {
            productList.add(Product(
                imageUrl: value["imageUrl"],
                description: value["description"],
                price: double.parse(value["price"]),
                subHeading: value["subHeading"],
                type: value["type"]))
          });
      _items = productList;
      _filtered = List.from(productList);
      notifyListeners();
    } else {
      throw "erro";
    }
  }

  Future<void> addProduct(Product productItem) async {
    // ignore: unused_local_variable
    var response = await http.post(url,
        body: json.encode({
          'imageUrl': productItem.imageUrl,
          'price': productItem.price.toString(),
          'type': productItem.type,
          'subHeading': productItem.subHeading,
          'description': productItem.description
        }));
    _items.add(productItem);

    notifyListeners();
  }
}


//  Product(
//         imageUrl:
//             "https://media.istockphoto.com/photos/take-out-pizza-in-a-box-picture-id1134570374?b=1&k=20&m=1134570374&s=170667a&w=0&h=A6nt9VKDm8nefj2TGqLYejaTU87cKCgMp0jHt_RATlE=",
//         price: 300,
//         type: "tomato soup",
//         subHeading: "Beef and Mushrooms with Smashed Potatoes",
//         description:
//             "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
//     Product(
//         imageUrl:
//             "https://media.istockphoto.com/photos/cannabis-food-withpizza-on-wooden-tray-and-chilli-basil-leaf-top-view-picture-id1155333183?k=20&m=1155333183&s=612x612&w=0&h=93LKF9kiiVTvcJvXHj-BAYvpxz7wjQ-2qZSt_mECzdw=",
//         price: 300,
//         type: "kenyan pizza",
//         subHeading: "Potluck Macaroni and Cheese",
//         description:
//             "This is the best chicken potpie recipe! Chock-full of chicken, potatoes, peas and corn, this recipe makes two golden pies, so you can serve one at supper and save the other for a busy night. —Karen Johnson, Bakersfield, California"),
//     Product(
//         imageUrl:
//             "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
//         price: 250,
//         type: "madd max",
//         subHeading: "Favorite Chicken Potpie",
//         description:
//             "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
//     Product(
//         imageUrl:
//             "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
//         price: 350,
//         type: "madd max",
//         subHeading: "Contest-Winning Broccoli Chicken Casserole",
//         description:
//             "pizza, dish of Italian origin consisting of a flattened disk of bread dough topped with some combination of olive oil, oregano, tomato, olives, mozzarella or other cheese, and many other ingredients, baked quickly—usually, in a commercial setting, using a wood-fired oven heated to a very high temperature—and served hot ."),
//     Product(
//         imageUrl:
//             "https://media.istockphoto.com/photos/pizza-three-large-whole-veg-chicken-pepperoni-mushroom-onion-pepper-picture-id1288432988?k=20&m=1288432988&s=612x612&w=0&h=uQdU4bXWX1lQtsEO4jz8SYkrhO7rIiODXuzXufwzLgs=",
//         price: 300,
//         type: "madd max",
//         subHeading: "Traditional Meat Loaf",
//         description:
//             "Topped with a sweet sauce, this traditional meat loaf recipe tastes so good that you might want to double it so everyone can have seconds. It also freezes well. —Gail Graham, Maple Ridge, British Columbia")