import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class SelectTemperature extends StatefulWidget {
  const SelectTemperature({Key? key}) : super(key: key);

  @override
  State<SelectTemperature> createState() => _SelectTemperatureState();
}

class _SelectTemperatureState extends State<SelectTemperature> {
  bool? c1;
  bool? c2;
  bool? c3;
  bool? c4;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  c1 = true;
                  c2 = false;
                  c3 = false;
                  c4 = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: c1 == true ? Colors.blue : Colors.grey)),
                  child: Text("Cold"),
                ),
              ),
              InkWell(
                onTap: () {
                  c1 = false;
                  c2 = true;
                  c3 = false;
                  c4 = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: c2 == true ? Colors.blue : Colors.grey)),
                  child: Text("Warm"),
                ),
              ),
              InkWell(
                onTap: () {
                  c1 = false;
                  c2 = false;
                  c3 = true;
                  c4 = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: c3 == true ? Colors.blue : Colors.grey)),
                  child: Text("Hot"),
                ),
              ),
              InkWell(
                onTap: () {
                  c1 = false;
                  c2 = false;
                  c3 = false;
                  c4 = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: c4 == true ? Colors.blue : Colors.grey)),
                  child: Text("Very Hot"),
                ),
              )
            ],
          ),
          RaisedButton(onPressed: () {
            c1 == null || c2 == null || c3 == null || c4 == null
                ? showSnackBar(context, "Plese select any Option")
                : routes("/Yourname", context);
          })
        ],
      ),
    );
  }
}
