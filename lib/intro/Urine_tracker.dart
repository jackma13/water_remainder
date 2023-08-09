import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Urinetracker extends StatefulWidget {
  const Urinetracker({Key? key}) : super(key: key);

  @override
  State<Urinetracker> createState() => _UrinetrackerState();
}

class _UrinetrackerState extends State<Urinetracker> {
  bool toggle = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffeae9f1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: PhysicalModel(
                  color: Colors.transparent,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: widthD,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Text(
                          "Urine Tracker",
                          style: heading,
                        ),
                        SizedBox(
                          height: heightD * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Your Urine Color gives inforamtion about your hydration status",
                            style: heading3,
                          ),
                        ),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Enable notification",
                              style: normaltext,
                            ),
                            Transform.scale(
                              scale: 1.5,
                              child: Switch(
                                value: toggle,
                                activeTrackColor:
                                    Color.fromARGB(255, 50, 34, 149),
                                inactiveThumbColor: Colors.white,
                                activeColor: Colors.white,
                                // activeColor: Colors.green,
                                onChanged: (bool value) {
                                  toggle = !toggle;
                                  setState(() {});
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: heightD * 0.04,
                        ),
                        Buttton_Design(
                            ontap: () {
                              databox.put("urinetracker", toggle);
                              routes("/SelectTemperature", context);
                            },
                            text: "Next"),
                        SizedBox(
                          height: heightD * 0.04,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Image.asset(
                "assets/img_17.jpg",
                height: heightD / 2,
              ),
            ],
          )),
    );
  }
}
