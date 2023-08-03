import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Selectplan extends StatefulWidget {
  const Selectplan({Key? key}) : super(key: key);

  @override
  State<Selectplan> createState() => _SelectplanState();
}

class _SelectplanState extends State<Selectplan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create a plan"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  btn2 = false;
                  btn1 = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: btn1 == true ? Colors.blue : Colors.grey)),
                  child: Text("For MySelf"),
                ),
              ),
              InkWell(
                onTap: () {
                  btn2 = true;
                  btn1 = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: btn2 == true ? Colors.blue : Colors.grey)),
                  child: Text("For My Child"),
                ),
              )
            ],
          ),
          RaisedButton(onPressed: () {
            btn1 == null || btn2 == null
                ? showSnackBar(context, "Plese select any Option")
                : routes("/SelectGoals", context);
          })
        ],
      ),
    );
  }
}
