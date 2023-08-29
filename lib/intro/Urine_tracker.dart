// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class Urinetracker extends StatefulWidget {
  const Urinetracker({Key? key}) : super(key: key);

  @override
  State<Urinetracker> createState() => _UrinetrackerState();
}

class _UrinetrackerState extends State<Urinetracker> {
  bool toggle = true;
   InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialadUnitId,
      request: AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          ad.fullScreenContentCallback = FullScreenContentCallback(
            onAdDismissedFullScreenContent: (ad) {
              Navigator.pushNamed(context, pagename);
            },
          );

          setState(() {
            _interstitialAd = ad;
          });
        },
        onAdFailedToLoad: (err) {
          print('Failed to load an interstitial ad: ${err.message}');
        },
      ),
    );
  }

  @override
  void dispose() {
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _loadInterstitialAd();
  }
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffeae9f1),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: heightD * 0.09,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: widthD,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: heightD * 0.02,
                          ),
                          Text(
                            "Urine Tracker",
                            style: heading,
                          ),
                          SizedBox(
                            height: heightD * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Your Urine Color gives inforamtion about your hydration status",
                              style: heading3,
                            ),
                          ),
                          SizedBox(
                            height: heightD * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "Enable notification",
                                style: normaltext,
                              ),
                              Transform.scale(
                                scale: 1.5,
                                child: Switch(
                                  value: toggle,
                                  activeTrackColor:
                                      const Color.fromARGB(255, 50, 34, 149),
                                  inactiveThumbColor: Colors.white,
                                  activeColor: Colors.white,
                                  // activeColor: Colors.green,
                                  onChanged: (bool value) {
                                    toggle = !toggle;
                                    setState(() {});
                                  },
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: heightD * 0.04,
                          ),
                          Buttton_Design(
                              ontap: () {
                                databox.put("urinetracker", toggle); if (_interstitialAd != null) {
                    pagename = '/SelectTemperature';
                    _interstitialAd?.show();
                  } else {
                                routes("/SelectTemperature", context);}
                              },
                              text: "Next"),
                          SizedBox(
                            height: heightD * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/img_17.jpg",
                  height: heightD / 2,
                ),
              ],
            ),
          )),
    );
  }
}
