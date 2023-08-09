import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Intro1 extends StatefulWidget {
  const Intro1({Key? key}) : super(key: key);

  @override
  State<Intro1> createState() => _Intro1State();
}

class _Intro1State extends State<Intro1> {
  @override
  Widget build(BuildContext context) {
    widthD = MediaQuery.of(context).size.width;
    heightD = MediaQuery.of(context).size.height;

    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(widthD * 0.03),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: heightD / 2.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.bgcolor.withOpacity(0.1),
                    ),
                  ),
                  Image.asset(
                    "assets/img_1.gif",
                    height: heightD / 2.5,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Most bodily functions depend on water, which makes up between 60% and 70% of your body weight.",
                    textAlign: TextAlign.center,
                    style: normaltext,
                  ),
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  Text(
                    "It participates in the delivery of food to the cells as well as its digestion and absorption. It keeps cells, tissues, organs, and systems running smoothly.",
                    textAlign: TextAlign.center,
                    style: normaltext,
                  ),
                ],
              ),
              Buttton_Design(
                ontap: () {
                  routes("/Intro2", context);
                },
                text: 'Next',
              )
            ],
          ),
        ),
      ),
    );
  }
}
