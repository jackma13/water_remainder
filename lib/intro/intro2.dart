import 'package:flutter/material.dart';

import '../globle_var.dart';

class Intro2 extends StatefulWidget {
  const Intro2({Key? key}) : super(key: key);

  @override
  State<Intro2> createState() => _Intro2State();
}

class _Intro2State extends State<Intro2> {
  @override
  Widget build(BuildContext context) {
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
                    "assets/img_2.gif",
                    height: heightD / 2.5,
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    "Water affects the movement and elimination of toxic compounds produced by metabolism, the regulation of body temperature, and the lubrication of joints",
                    textAlign: TextAlign.center,
                    style: normaltext,
                  ),
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  Text(
                    "Water equilibrium in our bodies is achieved by replacing lost water with water consumed with drinks and food.",
                    textAlign: TextAlign.center,
                    style: normaltext,
                  ),
                ],
              ),
              Buttton_Design(
                  ontap: () {
                    routes("/Selectplan", context);
                  },
                  text: "Let's Go")
            ],
          ),
        ),
      ),
    );
  }
}
