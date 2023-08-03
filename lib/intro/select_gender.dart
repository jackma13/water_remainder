import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  bool? male;
  bool? female;
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
                  female = false;
                  male = true;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: male == true ? Colors.blue : Colors.grey)),
                  child: Text("Male"),
                ),
              ),
              InkWell(
                onTap: () {
                  female = true;
                  male = false;
                  setState(() {});
                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          width: 2,
                          color: female == true ? Colors.blue : Colors.grey)),
                  child: Text("Female"),
                ),
              )
            ],
          ),
          RaisedButton(onPressed: () {
            male == null || female == null
                ? showSnackBar(context, "Plese select any Option")
                : routes("/MedicalInforamtion", context);
          })
        ],
      ),
    );
  }
}
