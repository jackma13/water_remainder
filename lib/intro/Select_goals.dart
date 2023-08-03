import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class SelectGoals extends StatefulWidget {
  const SelectGoals({Key? key}) : super(key: key);

  @override
  State<SelectGoals> createState() => _SelectGoalsState();
}

class _SelectGoalsState extends State<SelectGoals> {
  List golls = [];
  bool g1 = false;
  bool g2 = false;
  bool g3 = false;
  bool g4 = false;
  @override
  void initState() {
    if (btn1 == true) {
      golls.addAll(["Beauty", "Loss Weight", "Health", "Muscle Building"]);
    } else {
      golls.addAll(["Cognitive Performance", "Loss Weight", "Health", "Othre"]);
    }
    super.initState();
  }

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
                    g1 = !g1;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: g1 == true ? Colors.blue : Colors.grey)),
                    child: Text(golls[0]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    g2 = !g2;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: g2 == true ? Colors.blue : Colors.grey)),
                    child: Text(golls[1]),
                  ),
                )
              ],
            ),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    g3 = !g3;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: g3 == true ? Colors.blue : Colors.grey)),
                    child: Text(golls[2]),
                  ),
                ),
                InkWell(
                  onTap: () {
                    g4 = !g4;
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 2,
                            color: g4 == true
                                ? Colors.blue
                                : Color.fromARGB(255, 57, 56, 56))),
                    child: Text(golls[3]),
                  ),
                )
              ],
            ),
            RaisedButton(onPressed: () {
              g1 == false && g2 == false && g3 == false && g4 == false
                  ? showSnackBar(context, "Plese select any Option")
                  : routes("/SelectNotification", context);
            })
          ],
        ));
  }
}
