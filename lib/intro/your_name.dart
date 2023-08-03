import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Yourname extends StatefulWidget {
  const Yourname({Key? key}) : super(key: key);

  @override
  State<Yourname> createState() => _YournameState();
}

class _YournameState extends State<Yourname> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Name"),
          Form(
            key: _formKey,
            child: TextFormField(
              controller: namecontroller,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter Name';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Enter Your Name",
                fillColor: Colors.white30,
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          RaisedButton(onPressed: () {
            if (_formKey.currentState!.validate()) {
              routes("/Homenavigation", context);
            }
          })
        ],
      ),
    );
  }
}
