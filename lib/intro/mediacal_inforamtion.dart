import 'package:flutter/material.dart';

import '../globle_var.dart';

class MedicalInforamtion extends StatefulWidget {
  const MedicalInforamtion({Key? key}) : super(key: key);

  @override
  State<MedicalInforamtion> createState() => _MedicalInforamtionState();
}

class _MedicalInforamtionState extends State<MedicalInforamtion> {
  bool bt1 = false;
  bool bt2 = true;
  bool bt3 = false;
  bool bt4 = true;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffb5b7dd),
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
                          "Medical Information",
                          style: heading,
                        ),
                        SizedBox(
                          height: heightD * 0.05,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  btn2 == true
                                      ? "Does your child have regular toilets habits?"
                                      : "Do you have an oedema problem?",
                                  style: heading3,
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(255, 220, 219, 219),
                                    borderRadius: BorderRadius.circular(100)),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        bt1 = true;
                                        bt2 = false;
                                        setState(() {});
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: bt1
                                                  ? const Color(0xffb5b7dd)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Text(
                                            " Yes",
                                            style: heading2.copyWith(
                                                color: bt1
                                                    ? Colors.white
                                                    : Colors.black),
                                          )),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        bt1 = false;
                                        bt2 = true;
                                        setState(() {});
                                      },
                                      child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                              color: bt2
                                                  ? const Color(0xffb5b7dd)
                                                  : Colors.transparent,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          child: Text(
                                            " No ",
                                            style: heading2.copyWith(
                                                color: bt2
                                                    ? Colors.white
                                                    : Colors.black),
                                          )),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        btn2 == false
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Do you have regular toilet habits?",
                                        style: heading3,
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: const Color.fromARGB(
                                              255, 220, 219, 219),
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              bt3 = true;
                                              bt4 = false;
                                              setState(() {});
                                            },
                                            child: Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: bt3
                                                        ? const Color(
                                                            0xffb5b7dd)
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Text(
                                                  " Yes",
                                                  style: heading2.copyWith(
                                                      color: bt3
                                                          ? Colors.white
                                                          : Colors.black),
                                                )),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              bt3 = false;
                                              bt4 = true;
                                              setState(() {});
                                            },
                                            child: Container(
                                                padding: const EdgeInsets.all(8),
                                                decoration: BoxDecoration(
                                                    color: bt4
                                                        ? const Color(
                                                            0xffb5b7dd)
                                                        : Colors.transparent,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100)),
                                                child: Text(
                                                  " No ",
                                                  style: heading2.copyWith(
                                                      color: bt4
                                                          ? Colors.white
                                                          : Colors.black),
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : const SizedBox(),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Buttton_Design(
                            ontap: () {
                              routes("/Urinetracker", context);
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
                "assets/img_16.jpg",
                height: heightD / 2,
              ),
            ],
          )),
    );
  }
}
