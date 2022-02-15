import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    Key? key,required this.imageUrl,required this.price,required this.type,required this.subHeading,required this.description
  }) : super(key: key);
  final String imageUrl;
  final int price;
  final String type;
  final String subHeading;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(right: 20),
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(40)),
          color: Colors.purple.withOpacity(0.1),
        ),
        child: Stack(
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipOval(
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
             Positioned(
                top: 20,
                right: 5,
                child: Text(
                  "$price ksh",
                  style: const TextStyle(
                      color: Colors.purple,
                      fontSize: 20,
                      fontWeight: FontWeight.w900),
                )),
            Positioned(
              top: 220,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: 250,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Text(type,
                        style: const TextStyle(
                            color: Colors.purple,
                            fontSize: 30,
                            fontWeight: FontWeight.w900)),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(subHeading,
                            style: Theme.of(context).textTheme.headline6)),
                     Text(
                      description,
                      style: const TextStyle(color: Colors.black, fontSize: 20),
                      maxLines: 4,
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
