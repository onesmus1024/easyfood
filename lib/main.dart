import 'package:eazyfood/providers/products.dart';
import 'package:eazyfood/views/add_edit_product.dart';
import 'package:eazyfood/views/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mpesa_flutter_plugin/mpesa_flutter_plugin.dart';
import 'package:eazyfood/keys/globay_key.dart';

void main() {
   MpesaFlutterPlugin.setConsumerKey(consumerKey);
  MpesaFlutterPlugin.setConsumerSecret(consumerSecret);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Products())
      ],
      child: MaterialApp(
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
        home: const Scaffold( 
          body: Home(),
        ),
        routes: {EditAddProduct.routName: (context) => const EditAddProduct(),
        
        },
      ),
    );
  }
}
