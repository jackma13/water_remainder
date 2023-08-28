// ignore_for_file: camel_case_types

import 'dart:io';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:numberpicker/numberpicker.dart';

double heightD = 0;
double widthD = 0;
int pageIndex = 0;
int totaldrink = 0;
String dates = "";
bool? btn1;
bool? btn2;
bool h1 = true;
bool h2 = false;
bool h4 = false;
bool edit = false;
final databox = Hive.box("personaldata");
final historybox = Hive.box("history");
final historybox2 = Hive.box("history2");
double sliderDiscreteValue = 0;

class SelectActivity extends StatefulWidget {
  const SelectActivity({Key? key}) : super(key: key);

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Activicty",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Slider(
                      value: sliderDiscreteValue,
                      min: 0,
                      max: 100,
                      divisions: 2,
                      // label: _sliderDiscreteValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          sliderDiscreteValue = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Low"),
                        Text("Medium"),
                        Text("High")
                      ],
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              databox.put("activity", sliderDiscreteValue);
                              edit
                                  ? routes("/PersonalInformtion", context)
                                  : routes("/Homenavigation", context);
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

int currentHorizontalIntValue = 30;

class SelectWeight extends StatefulWidget {
  const SelectWeight({Key? key}) : super(key: key);

  @override
  State<SelectWeight> createState() => _SelectWeightState();
}

class _SelectWeightState extends State<SelectWeight> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Weight",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Center(
                      child: Text(
                        "$currentHorizontalIntValue KG",
                        style: heading3,
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    NumberPicker(
                      value: currentHorizontalIntValue,
                      minValue: 30,
                      maxValue: 200,
                      step: 1,
                      itemHeight: 100,
                      axis: Axis.horizontal,
                      onChanged: (value) =>
                          setState(() => currentHorizontalIntValue = value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black26),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              databox.put("Weight", currentHorizontalIntValue);
                              edit
                                  ? routes("/PersonalInformtion", context)
                                  : routes("/Homenavigation", context);
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

int watergoal = 1200;

class WaterGoals extends StatefulWidget {
  const WaterGoals({Key? key}) : super(key: key);

  @override
  State<WaterGoals> createState() => _WaterGoalsState();
}

class _WaterGoalsState extends State<WaterGoals> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Water Goal",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Center(
                      child: Text(
                        "$watergoal Ml",
                        style: heading3,
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    NumberPicker(
                      value: watergoal,
                      minValue: 200,
                      maxValue: 100000,
                      step: 10,
                      itemHeight: 100,
                      axis: Axis.horizontal,
                      onChanged: (value) => setState(() => watergoal = value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black26),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              databox.put("watergoal", watergoal);
                              routes("/Homenavigation", context);
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

TextStyle normaltext = TextStyle(
  fontWeight: FontWeight.w500,
  color: const Color.fromARGB(255, 44, 44, 44),
  fontSize: widthD / 25,
);
TextStyle heading = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: widthD / 20,
);
TextStyle heading2 = TextStyle(
  color: Colors.black,
  fontSize: widthD / 25,
);
TextStyle heading3 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: widthD / 25,
);
TextStyle heading4 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: widthD / 22,
);
TextStyle normaltext2 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: widthD / 20,
);

routes(String name, BuildContext context) {
  Navigator.pushNamed(context, name);
}

class AppColors {
  static Color bgcolor = const Color.fromARGB(255, 3, 123, 220);
}

void showSnackBar(BuildContext context, value) {
  var snackBar = SnackBar(
    content: Text(value, style: const TextStyle(color: Colors.white)),
    margin: const EdgeInsets.all(15),
    duration: const Duration(seconds: 1),
    backgroundColor: const Color.fromARGB(255, 97, 96, 96),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

String dropdownvalue = 'Every 30 Minutes';
var items = [
  'Every 30 Minutes',
  'Every 1 Hours',
  'Every 2 Hours',
  'Every 4 Hours',
  'Every 6 Hours',
];
List watertype = [
  {"name": "Water", "img": "water1.png", "hydration": 100, "caffeine": 0},
  {
    "name": "Sparkling water",
    "img": "water2.png",
    "hydration": 100,
    "caffeine": 0
  },
  {
    "name": "Mineral water",
    "img": "water3.png",
    "hydration": 100,
    "caffeine": 0
  },
  {"name": "Soy Milk", "img": "water4.png", "hydration": 90, "caffeine": 0},
  {"name": "Milk shake", "img": "water5.png", "hydration": 68, "caffeine": 0},
  {"name": "Cow milk", "img": "water6.png", "hydration": 88, "caffeine": 0},
  {"name": "Kefir", "img": "water7.png", "hydration": 87, "caffeine": 0},
  {
    "name": "Lactose free milk",
    "img": "water8.png",
    "hydration": 88,
    "caffeine": 0
  },
  {"name": "Coconut milk", "img": "water9.png", "hydration": 95, "caffeine": 0},
  {"name": "ayran", "img": "water10.png", "hydration": 75, "caffeine": 0},
  {"name": "Almond milk", "img": "water11.png", "hydration": 96, "caffeine": 0},
];
List glasstype = [
  {"name": "Small glass", "img": "glass1.png"},
  {"name": "Medium glass", "img": "glass2.png"},
  {"name": "Large glass", "img": "glass3.png"},
  {"name": "Bottle", "img": "glass4.png"},
  {"name": "Paper Cup", "img": "glass5.png"},
];
int? urineindex;
List mllist = [200, 240, 350, 475, 175];

List urinelist = [
  {
    "color": const Color.fromARGB(255, 247, 243, 204),
    "image": "assets/track1.png",
    "type": "Hydrated",
    "dis": "Congratulations! you are drinking enough water."
  },
  {
    "color": const Color.fromARGB(255, 251, 243, 173),
    "image": "assets/track1.png",
    "type": "Hydrated",
    "dis": "Congratulations! you are drinking enough water."
  },
  {
    "color": const Color.fromARGB(255, 252, 243, 156),
    "image": "assets/track2.png",
    "type": "Mildly Dehydrated",
    "dis": "You need to drink more water."
  },
  {
    "color": const Color.fromARGB(255, 249, 236, 124),
    "image": "assets/track2.png",
    "type": "Mildly Dehydrated",
    "dis": "You need to drink more water."
  },
  {
    "color": const Color.fromARGB(255, 250, 235, 102),
    "image": "assets/track3.png",
    "type": "Very Dehydrated",
    "dis": "Health risk! You are very dehydrated You need to drink more water."
  },
  {
    "color": const Color.fromARGB(255, 241, 222, 55),
    "image": "assets/track3.png",
    "type": "Very Dehydrated",
    "dis": "Health risk! You are very dehydrated You need to drink more water."
  },
  {
    "color": const Color.fromARGB(255, 210, 193, 45),
    "image": "assets/track4.png",
    "type": "Severely Dehydrated",
    "dis":
        "Health risk! You are very severely dehydrated You need to drink more water."
  },
  {
    "color": const Color.fromARGB(255, 165, 149, 3),
    "image": "assets/track4.png",
    "type": "Severely Dehydrated",
    "dis":
        "Health risk! You are very severely dehydrated You need to drink more water."
  },
];

class Buttton_Design extends StatelessWidget {
  const Buttton_Design({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);
  final Function ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: widthD / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: AppColors.bgcolor),
        child: Center(
          child: Text(
            text,
            style: normaltext2,
          ),
        ),
      ),
    );
  }
}

Future<bool> exitapp(context) async {
  return await showDialog(
          context: context,
          builder: (context) => SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Container(
                  width: 350,
                  height: 420,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Material(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    child: Padding(
                      padding: EdgeInsets.all(widthD / 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(
                            "assets/splash.png",
                            height: widthD * 0.4,
                          ),
                          Text(
                            "Are you sure want to exit app?",
                            textAlign: TextAlign.center,
                            style: heading4,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  exit(0);
                                },
                                child: Container(
                                  width: widthD / 4,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.bgcolor),
                                  child: Center(
                                      child: Text(
                                    "Yes",
                                    style: normaltext2,
                                  )),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: widthD / 4,
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColors.bgcolor),
                                  child: Center(
                                      child: Text(
                                    "No",
                                    style: normaltext2,
                                  )),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ))) ??
      false;
}
class DeveloperSeries {
  final String year;
  final String cat;
  final int amount;
  final charts.Color barColor;

  DeveloperSeries({
    required this.year,
    required this.amount,
    required this.barColor,
    required this.cat,
  });
}