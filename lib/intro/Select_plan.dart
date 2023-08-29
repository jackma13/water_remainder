// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class Selectplan extends StatefulWidget {
  const Selectplan({Key? key}) : super(key: key);

  @override
  State<Selectplan> createState() => _SelectplanState();
}

class _SelectplanState extends State<Selectplan> {
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
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    );
  }

  @override
  void dispose() {
    _bannerAd.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    loadbanner();
    _bannerAd.load();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 137, 198, 247),
        bottomNavigationBar: SizedBox(
          height: _bannerAd.size.height.toDouble(),
          width: _bannerAd.size.width.toDouble(),
          child: _isBannerAdReady
              ? AdWidget(ad: _bannerAd)
              : Center(
                  child: Text("loading ads...",
                      style: TextStyle(color: Colors.black)),
                ),
        ),
        body: Column(
          children: [
            const Expanded(child: SizedBox()),
            Image.asset(
              "assets/img_5.gif",
              height: heightD / 2.5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.all(widthD * 0.03),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: heightD * 0.01,
                    ),
                    Text(
                      "Create a plan",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            btn2 = false;
                            btn1 = true;
                            setState(() {});
                          },
                          child: PhysicalModel(
                            elevation: 2,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 2,
                                        color: btn1 == true
                                            ? AppColors.bgcolor
                                            : Colors.transparent)),
                                child: Column(children: [
                                  Image.asset(
                                    "assets/img_4.png",
                                    height: heightD / 6,
                                  ),
                                  Text("For MySelf", style: heading2)
                                ])),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            btn2 = true;
                            btn1 = false;
                            setState(() {});
                          },
                          child: PhysicalModel(
                            elevation: 2,
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 2,
                                      color: btn2 == true
                                          ? AppColors.bgcolor
                                          : Colors.transparent)),
                              child: Column(children: [
                                Image.asset(
                                  "assets/img_3.png",
                                  height: heightD / 6,
                                ),
                                Text("For My Child", style: heading2)
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Buttton_Design(
                        ontap: () {
                          if (btn1 == null || btn2 == null) {
                            showSnackBar(context, "Plese select any Option");
                          } else {
                            routes("/SelectGoals", context);
                          }
                        },
                        text: "Next"),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
