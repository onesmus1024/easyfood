import 'package:eazyfood/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';

class EditAddProduct extends StatefulWidget {
  const EditAddProduct({Key? key}) : super(key: key);
  static const routName = '/editAddProduct';

  @override
  State<EditAddProduct> createState() => _EditAddProductState();
}

class _EditAddProductState extends State<EditAddProduct> {
  /*  XFile? _image;
  final ImagePicker picker = ImagePicker();
  Future<void> _getImage() async {
    final image = await picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  } */

  final _form = GlobalKey<FormState>();

  final _productToAdd = Product(
      imageUrl: "", description: "", price: 0, subHeading: "", type: "");

  void _save() {
    _form.currentState!.validate();
    _form.currentState!.save();
    
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Row(
        children: const [
          Text("you have added a product"),
          Spacer(),
          Icon(Icons.check_box)
        ],
      ),
      backgroundColor: Colors.green,
    ));
    Provider.of<Products>(context, listen: false).addProduct(_productToAdd);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("products")),
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Form(
            key: _form,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    onSaved: (newValue) =>
                        {_productToAdd.type = newValue.toString()},
                    validator: (newValue) {
                      if (newValue == null||newValue.isEmpty) {
                        return "This field can't be empty ";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "meal type",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 4,
                    onSaved: (newValue) =>
                        {_productToAdd.subHeading = newValue.toString()},
                    decoration: InputDecoration(
                      label: Text(
                        "Heading",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    maxLines: 4,
                    onSaved: (newValue) =>
                        {_productToAdd.description = newValue.toString()},
                    decoration: InputDecoration(
                        label: Text(
                          "description",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        border: const OutlineInputBorder(),
                        hintMaxLines: 3),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    onSaved: (newValue) =>
                        {_productToAdd.price = double.parse(newValue.toString())},
                    decoration: InputDecoration(
                        label: Text(
                          "price",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        border: const OutlineInputBorder()),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onSaved: (newValue) =>
                        {_productToAdd.imageUrl = newValue.toString()},
                    validator: (newValue) {
                      if (!(newValue.toString().startsWith("http") ||
                          newValue.toString().startsWith("https"))) {
                        return "use a valid image url";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      label: Text(
                        "image url",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width,child: ElevatedButton(onPressed: _save, child: const Text("submit")))
                ],
              ),
            )),
      ),
    );
  }
}
