import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({Key? key, required this.category}) : super(key: key);

  final String category;

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        color: isActive
            ? Theme.of(context).primaryColor.withOpacity(0.2)
            : Colors.white,
        child: Text(
          widget.category,
          style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: 1 == 0 ? Colors.purple : Colors.green),
        ),
      ),
    );
  }
}
