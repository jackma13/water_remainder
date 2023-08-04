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
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(
                              Icons.access_time_filled,
                              size: 30,
                              color: Color(0xff9e9ea0),
                            ),
                            Text(
                              "Recent",
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 1;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(Icons.person,
                                size: 30, color: Color(0xff9e9ea0)),
                            Text(
                              "Contacts",
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 2;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(Icons.keyboard,
                                size: 30, color: Color(0xff9e9ea0)),
                            Text(
                              "Key pad",
                            )
                          ],
                        )),
                    InkWell(
                        onTap: () {
                          pageIndex = 3;
                          setState(() {});
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Icon(Icons.settings,
                                size: 30, color: Color(0xff9e9ea0)),
                            Text(
                              "Setting",
                            )
                          ],
                        )),
                  ],
                ),
              ))),
    );
  }
}
