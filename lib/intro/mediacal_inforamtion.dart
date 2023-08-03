import 'package:flutter/material.dart';

import '../globle_var.dart';

class MedicalInforamtion extends StatefulWidget {
  const MedicalInforamtion({Key? key}) : super(key: key);

  @override
  State<MedicalInforamtion> createState() => _MedicalInforamtionState();
}

class _MedicalInforamtionState extends State<MedicalInforamtion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text("Do you have an oedema problem?"),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Yes")),
              TextButton(onPressed: () {}, child: Text("No"))
            ],
          ),
          Text("Do you have regular toilet habits?"),
          Row(
            children: [
              TextButton(onPressed: () {}, child: Text("Yes")),
              TextButton(onPressed: () {}, child: Text("No"))
            ],
          ),
          RaisedButton(onPressed: () {
            routes("/Urinetracker", context);
          })
        ],
      ),
    );
  }
}
