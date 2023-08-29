// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import 'dart:io';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/all_cup.dart';
import 'package:water_remainder/alldrinks.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/Graphpage.dart';
import 'package:water_remainder/health/health_tips1.dart';
import 'package:water_remainder/health/health_tips2.dart';
import 'package:water_remainder/health/health_tips3.dart';
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

AppOpenAd? openAd;

Future<void> loadAd() async {
  await AppOpenAd.load(
      adUnitId: appopenad,
      request: const AdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
        print('ad is loaded');
        openAd = ad;
        openAd!.show();
      }, onAdFailedToLoad: (error) {
        print('ad failed to load $error');
      }),
      orientation: AppOpenAd.orientationPortrait);
}

void showAd() {
  if (openAd == null) {
    print('trying tto show before loading');
    loadAd();
    return;
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.instance.initialize();
  await loadAd();
  Directory appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  await Hive.openBox("personaldata");
  await Hive.openBox("history");
  await Hive.openBox("history2");
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
          "/Healthtips3": (context) => const Healthtips3(),
          "/Healthtips1": (context) => const Healthtips1(),
          "/Healthtips2": (context) => const Healthtips2(),
          "/Graphpage": (context) => const Graphpage(),
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
