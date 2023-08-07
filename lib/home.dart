import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:flutter_custom_tab_bar/indicator/round_indicator.dart';
import 'package:flutter_custom_tab_bar/indicator/standard_indicator.dart';
import 'package:flutter_custom_tab_bar/transform/color_transform.dart';
import 'package:flutter_custom_tab_bar/transform/scale_transform.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:water_remainder/globle_var.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController _controller = PageController(initialPage: 3);
  final CustomTabBarController _tabBarController = CustomTabBarController();

  @override
  void initState() {
    super.initState();
  }

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
        transform: ColorsTransform(
            highlightColor: Colors.white,
            normalColor: Colors.black,
            builder: (context, color) {
              return Container(
                decoration: BoxDecoration(
                    color: color == const Color(0xff000000)
                        ? const Color.fromARGB(255, 210, 208, 208)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(100)),
                padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                alignment: Alignment.center,
                child: Text(
                  "  ${watertype[index]["name"]}  ",
                  style: TextStyle(
                      fontSize: widthD / 22,
                      fontWeight: FontWeight.bold,
                      color: color),
                ),
              );
            }),
        index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Drink Water",
              style: heading,
            ),
            Text(
              "Today",
              style: normaltext,
            ),
            SizedBox(
              height: heightD / 1.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: SizedBox(
                        height: heightD / 3,
                        width: widthD / 1.8,
                        child: LiquidCircularProgressIndicator(
                          value: 0.6,
                          borderColor: Colors.blue,
                          borderWidth: 4,
                          valueColor: const AlwaysStoppedAnimation(
                            Color.fromARGB(255, 103, 185, 251),
                          ),
                          backgroundColor: Colors.white,
                          direction: Axis.vertical,
                          center: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "0",
                                  style:
                                      heading.copyWith(fontSize: widthD / 10),
                                ),
                                Text(
                                  "/${databox.get("watergoal")} ml",
                                  style: heading,
                                )
                              ]),
                        )),
                  ),
                  SizedBox(
                    height: heightD * 0.02,
                  ),
                  SizedBox(
                    height: heightD / 8,
                    child: PageView.builder(
                        controller: _controller,
                        itemCount: watertype.length,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            "assets/${watertype[index]["img"]}",
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            routes("/Allcup", context);
                          },
                          child: Row(
                            children: [
                              const Icon(Icons.local_drink),
                              Text(
                                " Cup",
                                style: heading,
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "150 ml",
                          style: heading,
                        ),
                        InkWell(
                          onTap: () {
                            routes("/AllDrinks", context);
                          },
                          child: Row(
                            children: [
                              Text(
                                "Drinks",
                                style: heading,
                              ),
                              const Icon(Icons.arrow_forward_ios)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  CustomTabBar(
                    tabBarController: _tabBarController,
                    height: heightD / 15,
                    itemCount: watertype.length,
                    builder: getTabbarChild,
                    indicator: RoundIndicator(
                      color: AppColors.bgcolor,
                      top: 2.5,
                      bottom: 2.5,
                      left: 2.5,
                      right: 2.5,
                      radius: BorderRadius.circular(20),
                    ),
                    pageController: _controller,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
