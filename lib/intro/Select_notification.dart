// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class SelectNotification extends StatefulWidget {
  const SelectNotification({Key? key}) : super(key: key);

  @override
  State<SelectNotification> createState() => _SelectNotificationState();
}

class _SelectNotificationState extends State<SelectNotification> {
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

  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 190, 228, 251),
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
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Text(
                          "Notification frequency",
                          style: heading,
                        ),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: DropdownButton(
                            elevation: 10,
                            style: heading2,
                            isExpanded: true,
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: heightD * 0.03,
                        ),
                        Buttton_Design(
                            ontap: () {
                              databox.put(
                                  "notifiaction",
                                  dropdownvalue == "Every 30 Minutes"
                                      ? 30
                                      : dropdownvalue == "Every 1 Hours"
                                          ? 60
                                          : dropdownvalue == "Every 2 Hours"
                                              ? 120
                                              : dropdownvalue == "Every 4 Hours"
                                                  ? 240
                                                  : dropdownvalue ==
                                                          'Every 6 Hours'
                                                      ? 360
                                                      : 30);
                              routes("/Sleeppattern", context);
                            },
                            text: "Next"),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/img_12.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
