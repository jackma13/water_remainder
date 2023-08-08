import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:water_remainder/all_cup.dart';
import 'package:water_remainder/alldrinks.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/home.dart';
import 'package:water_remainder/home_navigation.dart';
import 'package:water_remainder/home_urine_tracker.dart';
import 'package:water_remainder/intro/Select_goals.dart';
import 'package:water_remainder/intro/Select_notification.dart';
import 'package:water_remainder/intro/Select_plan.dart';
import 'package:water_remainder/intro/Urine_tracker.dart';
import 'package:water_remainder/intro/intro1.dart';
import 'package:water_remainder/intro/intro2.dart';
import 'package:water_remainder/intro/mediacal_inforamtion.dart';
import 'package:water_remainder/intro/personal_information.dart';
import 'package:water_remainder/intro/select_gender.dart';
import 'package:water_remainder/intro/select_temperature.dart';
import 'package:water_remainder/intro/sleep_pattern.dart';
import 'package:water_remainder/intro/your_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("personaldata");
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          "/Intro2": (context) => const Intro2(),
          "/Selectplan": (context) => const Selectplan(),
          "/SelectGoals": (context) => const SelectGoals(),
          "/SelectNotification": (context) => const SelectNotification(),
          "/Sleeppattern": (context) => const Sleeppattern(),
          "/PersonalInformtion": (context) => const PersonalInformtion(),
          "/SelectGender": (context) => const SelectGender(),
          "/MedicalInforamtion": (context) => const MedicalInforamtion(),
          "/Urinetracker": (context) => const Urinetracker(),
          "/SelectTemperature": (context) => const SelectTemperature(),
          "/Yourname": (context) => const Yourname(),
          "/Homenavigation": (context) => const Homenavigation(),
          "/AllDrinks": (context) => const AllDrinks(),
          "/Allcup": (context) => const Allcup(),
          "/HomeUrinetacker": (context) => const HomeUrinetacker(),
        },
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
              elevation: 0,
              color: Colors.white,
              iconTheme: IconThemeData(color: Colors.black)),
        ),
        home: databox.get("name") == null
            ? const Intro1()
            : const Homenavigation());
  }
}
