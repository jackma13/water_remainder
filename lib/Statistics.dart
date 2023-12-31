// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:intl/intl.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  DateTime now = DateTime.now();
  InterstitialAd? _interstitialAd;
  late BannerAd _bannerAd;
  bool _isBannerAdReady = false;

  loadbanner() {
    _bannerAd = BannerAd(
      adUnitId: banneradUnitId,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          // print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
  }

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
    _bannerAd.dispose();
    _interstitialAd?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    loadbanner();
    _bannerAd.load();
    _loadInterstitialAd();
  }

  @override
  Widget build(BuildContext context) {
    List weeklist = [
      {
        "name": "Mon",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 1)))
      },
      {
        "name": "Tue",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 2)))
      },
      {
        "name": "Wed",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 3)))
      },
      {
        "name": "Thu",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 4)))
      },
      {
        "name": "Fri",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 5)))
      },
      {
        "name": "Sat",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 6)))
      },
      {
        "name": "Sun",
        "date": DateFormat('dd')
            .format(now.subtract(Duration(days: now.weekday - 7)))
      },
    ];

    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 211, 210, 210),
        bottomNavigationBar: SizedBox(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: _isBannerAdReady
              ? AdWidget(ad: _bannerAd)
              : const Center(
                  child: Text("loading ads...",
                      style: TextStyle(color: Colors.black)),
                ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightD * 0.03,
                        ),
                        Text(
                          "Hello ${databox.get("name")},",
                          style: normaltext,
                        ),
                        SizedBox(
                          height: heightD * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Today's Goal ${(totaldrink / databox.get("watergoal") * 100).toStringAsFixed(0)} %",
                              style: heading,
                            ),
                            Text(
                              "$totaldrink/${databox.get("watergoal")} ml",
                              style: heading2,
                            )
                          ],
                        ),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Center(
                          child: LinearPercentIndicator(
                            animation: true,
                            animationDuration: 500,
                            lineHeight: heightD * 0.025,
                            percent: totaldrink /
                                        databox
                                            .get("watergoal")
                                            .roundToDouble() <
                                    1.0
                                ? totaldrink /
                                    databox.get("watergoal").roundToDouble()
                                : 1.0,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            progressColor: AppColors.bgcolor,
                            backgroundColor: Colors.grey[300],
                          ),
                        ),
                        SizedBox(
                          height: heightD * 0.04,
                        ),
                        InkWell(
                          onTap: () {
                            if (_interstitialAd != null) {
                              pagename = '/Healthtips1';
                              _interstitialAd?.show();
                            } else {
                              routes("/Healthtips1", context);
                            }
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "See health tips",
                                style: normaltext.copyWith(
                                    color: AppColors.bgcolor),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: AppColors.bgcolor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                DateFormat.yMMMMd().format(now),
                                style: normaltext.copyWith(
                                    color: AppColors.bgcolor),
                              ),
                              IconButton(
                                  onPressed: () {
                                    if (_interstitialAd != null) {
                                      pagename = '/Graphpage';
                                      _interstitialAd?.show();
                                    } else {
                                      routes("/Graphpage", context);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.bar_chart,
                                    color: AppColors.bgcolor,
                                  ))
                            ],
                          ),
                          SizedBox(
                            height: heightD * 0.01,
                          ),
                          Container(
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2, color: Colors.grey),
                                  color: Colors.white),
                              child: GridView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: EdgeInsets.all(widthD * 0.03),
                                itemCount: weeklist.length,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        childAspectRatio: .6,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                        crossAxisCount: 7),
                                itemBuilder: (context, index) {
                                  return Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        weeklist[index]["name"],
                                        style: normaltext,
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: DateFormat('dd').format(
                                                          DateTime.now()) ==
                                                      weeklist[index]["date"]
                                                  ? AppColors.bgcolor
                                                  : Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Text(
                                            weeklist[index]["date"],
                                            style: heading2.copyWith(
                                                color: DateFormat('dd').format(
                                                            DateTime.now()) ==
                                                        weeklist[index]["date"]
                                                    ? Colors.white
                                                    : Colors.black),
                                          ))
                                    ],
                                  );
                                },
                              ))
                        ],
                      )),
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "History",
                            style:
                                normaltext.copyWith(color: AppColors.bgcolor),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              thickness: 1,
                            ),
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            padding: EdgeInsets.all(widthD * 0.02),
                            itemCount: historybox.length,
                            itemBuilder: (context, index) {
                              var key = historybox.keys.toList();
                              var value = historybox.get(key[index]);

                              return Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${value["ml"]} ml",
                                          style: normaltext),
                                      Text(value["name"], style: normaltext),
                                      Text(value["date"], style: heading2),
                                    ],
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Divider(
                                      thickness: 1,
                                    ),
                                  )
                                ],
                              );
                            },
                          )
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
