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
      golls.addAll([
        ["Beauty", "assets/img_10.png"],
        ["Loss Weight", "assets/img_6.png"],
        ["Health", "assets/img_7.png"],
        ["Muscle Building", "assets/img_11.png"]
      ]);
    } else {
      golls.addAll([
        ["Cognitive \n Performance", "assets/img_8.png"],
        ["Loss Weight", "assets/img_6.png"],
        ["Health", "assets/img_7.png"],
        ["Other", "assets/img_9.png"]
      ]);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Select Your Goals"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    g1 = !g1;
                    setState(() {});
                  },
                  child: Column(
                    children: [
                      PhysicalModel(
                        elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: heightD / 4,
                          width: widthD / 3,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,
                                  color: g1 == true
                                      ? AppColors.bgcolor
                                      : Colors.transparent)),
                          child: Image.asset(
                            golls[0][1],
                            height: heightD / 8,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightD * 0.01,
                      ),
                      Text(golls[0][0],
                          textAlign: TextAlign.center, style: heading2)
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    g2 = !g2;
                    setState(() {});
                  },
                  child: Column(children: [
                    PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: heightD / 4,
                        width: widthD / 3,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: g2 == true
                                    ? AppColors.bgcolor
                                    : Colors.transparent)),
                        child: Image.asset(
                          golls[1][1],
                          height: heightD / 7,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.01,
                    ),
                    Text(golls[1][0], style: heading2)
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: heightD * 0.03,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    g3 = !g3;
                    setState(() {});
                  },
                  child: Column(children: [
                    PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: heightD / 4,
                        width: widthD / 3,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: g3 == true
                                    ? AppColors.bgcolor
                                    : Colors.transparent)),
                        child: Image.asset(
                          golls[2][1],
                          height: heightD / 7,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.01,
                    ),
                    Text(golls[2][0], style: heading2)
                  ]),
                ),
                InkWell(
                  onTap: () {
                    g4 = !g4;
                    setState(() {});
                  },
                  child: Column(children: [
                    PhysicalModel(
                      elevation: 10,
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        height: heightD / 4,
                        width: widthD / 3,
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 2,
                                color: g4 == true
                                    ? AppColors.bgcolor
                                    : Colors.transparent)),
                        child: Image.asset(
                          golls[3][1],
                          height: heightD / 7,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.01,
                    ),
                    Text(golls[3][0], style: heading2)
                  ]),
                ),
              ],
            ),
            SizedBox(
              height: heightD * 0.05,
            ),
            Buttton_Design(
                ontap: () {
                  g1 == false && g2 == false && g3 == false && g4 == false
                      ? showSnackBar(context, "Plese select any Option")
                      : routes("/SelectNotification", context);
                },
                text: "Next")
          ],
        ));
  }
}
