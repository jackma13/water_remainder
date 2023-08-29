import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:water_remainder/Adhelper.dart';
import 'package:water_remainder/globle_var.dart';

class SelectTemperature extends StatefulWidget {
  const SelectTemperature({Key? key}) : super(key: key);

  @override
  State<SelectTemperature> createState() => _SelectTemperatureState();
}

class _SelectTemperatureState extends State<SelectTemperature> {
  bool? c1;
  bool? c2;
  bool? c3;
  bool? c4;
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
          appBar: AppBar(
            title: const Text("Select Your Goals"),
          ),
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Text(
                  "Temperature is a fector that affects your water needs",
                  textAlign: TextAlign.center,
                  style: normaltext,
                ),
              ),
              SizedBox(
                height: heightD * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      c1 = true;
                      c2 = false;
                      c3 = false;
                      c4 = false;
                      setState(() {});
                    },
                    child: Column(
                      children: [
                        PhysicalModel(
                          elevation: 10,
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            height: heightD / 4.5,
                            width: widthD / 3,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    width: 2,
                                    color: c1 == true
                                        ? AppColors.bgcolor
                                        : Colors.transparent)),
                            child: Image.asset(
                              "assets/img_21.png",
                              height: heightD / 8,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: heightD * 0.01,
                        ),
                        Text("Cold",
                            textAlign: TextAlign.center, style: heading2)
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      c1 = false;
                      c2 = true;
                      c3 = false;
                      c4 = false;
                      setState(() {});
                    },
                    child: Column(children: [
                      PhysicalModel(
                        elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: heightD / 4.5,
                          width: widthD / 3,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,
                                  color: c2 == true
                                      ? AppColors.bgcolor
                                      : Colors.transparent)),
                          child: Image.asset(
                            "assets/img_18.png",
                            height: heightD / 7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightD * 0.01,
                      ),
                      Text("Warm", style: heading2)
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
                      c1 = false;
                      c2 = false;
                      c3 = true;
                      c4 = false;
                      setState(() {});
                    },
                    child: Column(children: [
                      PhysicalModel(
                        elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: heightD / 4.5,
                          width: widthD / 3,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,
                                  color: c3 == true
                                      ? AppColors.bgcolor
                                      : Colors.transparent)),
                          child: Image.asset(
                            "assets/img_20.png",
                            height: heightD / 7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightD * 0.01,
                      ),
                      Text("Hot", style: heading2)
                    ]),
                  ),
                  InkWell(
                    onTap: () {
                      c1 = false;
                      c2 = false;
                      c3 = false;
                      c4 = true;
                      setState(() {});
                    },
                    child: Column(children: [
                      PhysicalModel(
                        elevation: 10,
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: heightD / 4.5,
                          width: widthD / 3,
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 2,
                                  color: c4 == true
                                      ? AppColors.bgcolor
                                      : Colors.transparent)),
                          child: Image.asset(
                            "assets/img_19.png",
                            height: heightD / 7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: heightD * 0.01,
                      ),
                      Text("Very Hot", style: heading2)
                    ]),
                  ),
                ],
              ),
              Spacer(),
              Buttton_Design(
                  ontap: () {
                    c1 == null || c2 == null || c3 == null || c4 == null
                        ? showSnackBar(context, "Plese select any Option")
                        : routes("/Yourname", context);
                  },
                  text: "Next"),
              Padding(padding: EdgeInsets.only(bottom: heightD * 0.02))
            ],
          )),
    );
  }
}
