import 'package:flutter/material.dart';
import 'package:water_remainder/Statistics.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/home.dart';
import 'package:water_remainder/profile.dart';
import 'package:water_remainder/setting.dart';

class Homenavigation extends StatefulWidget {
  const Homenavigation({Key? key}) : super(key: key);

  @override
  State<Homenavigation> createState() => _HomenavigationState();
}

class _HomenavigationState extends State<Homenavigation> {
  final pages = [
    const Home(),
    const Statistics(),
    const Profile(),
    const Setting(),
  ];

  @override
  Widget build(BuildContext context) {
    widthD = MediaQuery.of(context).size.width;
    heightD = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          child: SizedBox(
              height: heightD / 11,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        onTap: () {
                          pageIndex = 0;
                          h1 = true;
                          h2 = false;
                          h3 = false;
                          h4 = false;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.home,
                              size: 30,
                              color: h1
                                  ? AppColors.bgcolor
                                  : const Color(0xff9e9ea0),
                            ),
                            Text(
                              "Home",
                              style: TextStyle(
                                  color: h1
                                      ? AppColors.bgcolor
                                      : const Color(0xff9e9ea0)),
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 1;
                          h1 = false;
                          h2 = true;
                          h3 = false;
                          h4 = false;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.access_time,
                                size: 30,
                                color: h2
                                    ? AppColors.bgcolor
                                    : const Color(0xff9e9ea0)),
                            Text(
                              "Statistic",
                              style: TextStyle(
                                  color: h2
                                      ? AppColors.bgcolor
                                      : const Color(0xff9e9ea0)),
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 2;
                          h1 = false;
                          h2 = false;
                          h3 = true;
                          h4 = false;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.account_circle_rounded,
                                size: 30,
                                color: h3
                                    ? AppColors.bgcolor
                                    : const Color(0xff9e9ea0)),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  color: h3
                                      ? AppColors.bgcolor
                                      : const Color(0xff9e9ea0)),
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 3;
                          h1 = false;
                          h2 = false;
                          h3 = false;
                          h4 = true;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(Icons.settings,
                                size: 30,
                                color: h4
                                    ? AppColors.bgcolor
                                    : const Color(0xff9e9ea0)),
                            Text(
                              "Setting",
                              style: TextStyle(
                                  color: h4
                                      ? AppColors.bgcolor
                                      : const Color(0xff9e9ea0)),
                            )
                          ],
                        )),
                  ],
                ),
              ))),
    );
  }
}
