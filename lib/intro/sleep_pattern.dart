import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class Sleeppattern extends StatefulWidget {
  const Sleeppattern({Key? key}) : super(key: key);

  @override
  State<Sleeppattern> createState() => _SleeppatternState();
}

class _SleeppatternState extends State<Sleeppattern> {
  TimeOfDay _time = const TimeOfDay(hour: 6, minute: 00);
  TimeOfDay _time2 = const TimeOfDay(hour: 22, minute: 00);
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
      });
    }
  }

  void _selectTime2() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time2,
    );
    if (newTime != null) {
      setState(() {
        _time2 = newTime;
      });
    }
  }
  InterstitialAd? _interstitialAd;

  void _loadInterstitialAd() {
    InterstitialAd.load(
      adUnitId: interstitialadUnitId,
      request: const AdRequest(),
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
          // print('Failed to load an interstitial ad: ${err.message}');
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
    super.initState();
    _loadInterstitialAd();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffc5e2ff),
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
                            "Select Pattern",
                            style: heading,
                          ),
                          SizedBox(
                            height: heightD * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Wake-up Time",
                                  style: heading3,
                                ),
                                InkWell(
                                  onTap: () {
                                    _selectTime();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _time.format(context),
                                        style: heading2,
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Bedtime Time",
                                  style: heading3,
                                ),
                                InkWell(
                                  onTap: () {
                                    _selectTime2();
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        _time2.format(context),
                                        style: heading2,
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: heightD * 0.02,
                          ),
                          Buttton_Design(
                              ontap: () {
                                databox.put("wakeup", _time.format(context));
                                databox.put("bedtime", _time2.format(context)); if (_interstitialAd != null) {
                    pagename = '/PersonalInformtion';
                    _interstitialAd?.show();
                  } else {
                                routes("/PersonalInformtion", context);}
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
                  "assets/img_13.jpg",
                  height: heightD / 2,
                ),
              ],
            ),
          )),
    );
  }
}
