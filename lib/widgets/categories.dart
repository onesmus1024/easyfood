import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class Category1 extends StatefulWidget {
  const Category1({Key? key}) : super(key: key);

  @override
  State<Category1> createState() => _CategoryState1();
}

class _CategoryState1 extends State<Category1> {
  int selectedIndex = 0;
  void selected(int index) {
    setState(() {
      selectedIndex = index;
      Provider.of<Products>(context, listen: false).getProducts;
      Provider.of<Products>(context, listen: false)
          .fetchProduct2(categories[index].toLowerCase());
    });
  }

  List<String> categories = [
    'All',
    'chicken',
    'soup',
    'vegetable',
    'cheese',
    'pizza',
    'non-vegetable',
    'beverages'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            selected(index);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: selectedIndex == index
                  ? Theme.of(context).primaryColor.withOpacity(0.2)
                  : Colors.transparent,
            ),
            padding: const EdgeInsets.all(10),
            child: Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: selectedIndex == index ? Colors.purple : Colors.green),
            ),
          ),
        );
      },
    );
  }
}
