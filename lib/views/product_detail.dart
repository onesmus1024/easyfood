import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductDetail extends StatefulWidget {
  const ProductDetail(
      {Key? key,
      required this.id,
      required this.image,
      required this.description,
      required this.price})
      : super(key: key);
  final String id;
  final String image;
  final String description;
  final int price;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool liked = false;
  void _handlelike() {
    setState(() {
      liked = !liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ListView(
          children: [
            Stack(children: [
              GestureDetector(onDoubleTap:_handlelike,child: Image.network(widget.image)),
              Positioned(
                  bottom: 15,
                  right: 15,
                  child: IconButton(
                    icon: Icon(Icons.favorite,
                        size: 50, color: liked ? Colors.red : Colors.grey),
                    onPressed: _handlelike,
                  ))
            ]),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            const Padding(
                padding: EdgeInsets.all(20),
                child: Text("Description",
                    style: TextStyle(fontWeight: FontWeight.w900))),
            Padding(
                padding: const EdgeInsets.all(20),
                child: Text(widget.description)),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("ksh ${widget.price}"),
                  ElevatedButton(
                      onPressed: () => {}, child: const Text("Add to cart")),
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
