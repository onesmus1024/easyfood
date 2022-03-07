import 'package:eazyfood/services/mpesa_pay.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Checkout extends StatefulWidget {
  Checkout({Key? key, required this.amount}) : super(key: key);
  static const routeName = '/checkout';
  double amount;

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late String phoneNumber;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("payment method"),
                    const SizedBox(
                      height: 10,
                    ),
                    Form(
                        key: _form,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onSaved: (newValue) {
                            newValue = newValue!.trim().toString();
                            newValue = newValue.replaceFirst('0', '254');
                            phoneNumber = newValue;
                          },
                          validator: (newValue) {
                            if (newValue!.length != 10 || newValue.isEmpty) {
                              return "please enter a valid phone number";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label: Text(
                              "Phone number",
                              style: TextStyle(
                                  color: Theme.of(context).primaryColor),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("subtotal"),
                const Text("="),
                Text("${widget.amount}")
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Delivery"), Text("="), Text('0.00')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("VAT"), Text("="), Text('0.00')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Total"),
                const Text("="),
                Text("${widget.amount}")
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () {
                      _form.currentState!.validate();
                      _form.currentState!.save();
                      MpesaPay.startCheckout(
                          userPhone: phoneNumber, amount: widget.amount);
                    },
                    child: const Text("paynow")))
          ],
        ),
      ),
    );
  }
}
