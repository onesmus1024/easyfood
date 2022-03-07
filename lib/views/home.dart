import 'package:eazyfood/views/add_edit_product.dart';
import 'package:eazyfood/widgets/categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:eazyfood/providers/products.dart';
import '../widgets/foodcard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isInit = true;
  bool isLoading = true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (isInit) {
      Provider.of<Products>(context)
          .fetchProduct()
          .then((value) => {isLoading = false});
    }
    isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    final _Products = Provider.of<Products>(context).getProducts;
    return RefreshIndicator(
      onRefresh: () => Provider.of<Products>(context)
          .fetchProduct()
          .then((value) => {isLoading = false}),
      child: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.restaurant),
          title: const Text("eazyfood"),
          elevation: 0,
          actions: const [Icon(Icons.shopping_cart)],
        ),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          child: IconButton(
              onPressed: () =>
                  Navigator.pushNamed(context, EditAddProduct.routName),
              icon: const Icon(Icons.add)),
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: Colors.purple),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  Container(
                    color: Theme.of(context).primaryColor.withOpacity(0.0),
                    child: const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "KARU easy way to book your delicious meal",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                    width: 50,
                    child: Category1(),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        children: const [
                          Text(
                            "Todays Special",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Spacer(),
                          Icon(Icons.arrow_circle_right_sharp)
                        ],
                      )),
                  Row(
                    children: [
                      _Products.isEmpty
                          ? const Center(
                              child: Text("At the moment no meal of that type"),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.7,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount: _Products.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return FoodCard(
                                      imageUrl: _Products[index].imageUrl,
                                      price: _Products[index].price,
                                      type: _Products[index].type,
                                      subHeading: _Products[index].subHeading,
                                      description:
                                          _Products[index].description);
                                },
                              ),
                            ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
