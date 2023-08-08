import 'package:flutter/material.dart';
import 'package:flutter_custom_tab_bar/custom_tab_bar.dart';
import 'package:flutter_custom_tab_bar/indicator/custom_indicator.dart';
import 'package:flutter_custom_tab_bar/indicator/round_indicator.dart';
import 'package:flutter_custom_tab_bar/transform/color_transform.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:intl/intl.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/notification_service.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final PageController _controller = PageController(initialPage: 1);
  final CustomTabBarController _tabBarController = CustomTabBarController();

  bool _canVibrate = true;
  @override
  void initState() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    dates = DateFormat('dd-MM-yyyy').format(date);
    databox.get("totaldrink") == null ||
            databox.get("time") == null ||
            databox.get("time") != dates
        ? totaldrink = 0
        : totaldrink = databox.get("totaldrink");

    mllist = databox.get("cupml");
    _init();
    localnotificationservice().initialize();
    super.initState();
  }

  Future<void> _init() async {
    bool canVibrate = await Vibrate.canVibrate;
    setState(() {
      _canVibrate = canVibrate;
    });
  }

  Widget getTabbarChild(BuildContext context, int index) {
    return TabBarItem(
        transform: ColorsTransform(
            highlightColor: Colors.white,
            normalColor: Colors.black,
            builder: (context, color) {
              return Row(
                children: [
                  SizedBox(width: widthD * 0.015),
                  Container(
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
                  ),
                ],
              );
            }),
        index: index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
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
                  ],
                ),
                InkWell(
                    onTap: () {
                      routes("/HomeUrinetacker", context);
                    },
                    child: Icon(Icons.abc_outlined))
              ],
            ),
          ),
          SizedBox(
            height: heightD / 1.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: CircleAvatar(
                      radius: widthD / 3.5,
                      backgroundColor: Colors.transparent,
                      child: LiquidCircularProgressIndicator(
                        value: totaldrink / databox.get("watergoal"),
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
                                totaldrink.toString(),
                                style: heading.copyWith(fontSize: widthD / 10),
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const WaterGoals();
                                      });
                                },
                                child: Text(
                                  "/${databox.get("watergoal")} ml",
                                  style: heading,
                                ),
                              )
                            ]),
                      )),
                ),
                SizedBox(
                  height: heightD / 4,
                  child: PageView.builder(
                      controller: _controller,
                      itemCount: watertype.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: InkWell(
                                onTap: () async {
                                  _canVibrate &&
                                          databox.get("vibration") == true
                                      ? Vibrate.vibrate()
                                      : null;
                                  await localnotificationservice()
                                      .quizenotification();
                                  databox.put(
                                      "totaldrink",
                                      totaldrink +
                                          mllist[databox.get("cupindex")]);
                                  totaldrink = databox.get("totaldrink");
                                  databox.put("time", dates);
                                  setState(() {});
                                },
                                child: Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Center(
                                      child: PhysicalModel(
                                        color: Colors.white,
                                        elevation: 5.0,
                                        shape: BoxShape.circle,
                                        child: Container(
                                          width: widthD / 3.4,
                                          decoration: const BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsets.all(widthD / 20),
                                            child: Image.asset(
                                              "assets/${watertype[index]["img"]}",
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomLeft,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Color.fromARGB(255, 225, 224, 224),
                                        child: Icon(Icons.add,
                                            color: AppColors.bgcolor),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
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
                        "${mllist[databox.get("cupindex")]} ml",
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
    ));
  }
}
