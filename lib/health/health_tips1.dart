import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class Healthtips1 extends StatefulWidget {
  const Healthtips1({Key? key}) : super(key: key);

  @override
  State<Healthtips1> createState() => _Healthtips1State();
}

class _Healthtips1State extends State<Healthtips1> {  InterstitialAd? _interstitialAd;

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
    _loadInterstitialAd();}
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        routes("/Homenavigation", context);
         return Future.value(true);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/health1.jpg"),
              Text(
                "Children should drink enough of water.",
                style: heading,
              ),
              SizedBox(
                height: heightD * 0.02,
              ),
              Text(
                "It is critical to address water needs at young ages since growth rates are rapid. Children who don't get enough water may experience problems with immune system development, renal health, heart health, and many other organ systems.",
                style: normaltext,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () { if (_interstitialAd != null) {
                    pagename = '/Healthtips2';
                    _interstitialAd?.show();
                  } else {
                        routes("/Healthtips2", context);}
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColors.bgcolor,
                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
