import 'package:eazyfood/views/home.dart';
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
      title: 'Eazyfood',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: Colors.purple,
        textTheme: const TextTheme(
          headline6: TextStyle(fontWeight: FontWeight.bold),
          headline5: TextStyle(fontWeight: FontWeight.normal),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(leading: const Icon(Icons.restaurant),title: const Text("eazyfood"),elevation: 0,actions: const [Icon(Icons.shopping_cart)],),
        floatingActionButton: Container(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.purple,
          ),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
        ),
        body:const Home(),
      ),
    );
  }
}
