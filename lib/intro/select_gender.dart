import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({Key? key}) : super(key: key);

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  bool? male;
  bool? female;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 204, 227, 255),
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
                        "Select Gender",
                        style: heading,
                      ),
                      SizedBox(
                        height: heightD * 0.05,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                female = false;
                                male = true;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: male == true
                                        ? const Color(0xff6998d0)
                                        : Colors.white,
                                    border: Border.all(
                                        width: 2,
                                        color: male == true
                                            ? Colors.transparent
                                            : Colors.grey)),
                                child: Text(
                                  "  Male  ",
                                  style: heading2.copyWith(
                                      color: male == true
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                female = true;
                                male = false;
                                setState(() {});
                              },
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: female == true
                                        ? const Color(0xff6998d0)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(
                                        width: 2,
                                        color: female == true
                                            ? Colors.transparent
                                            : Colors.grey)),
                                child: Text(
                                  " Female ",
                                  style: heading2.copyWith(
                                      color: female == true
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightD * 0.05,
                      ),
                      Buttton_Design(
                          ontap: () {
                            male == null || female == null
                                ? showSnackBar(
                                    context, "Plese select any Option")
                                : routes("/MedicalInforamtion", context);
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
              "assets/img_15.png",
              height: heightD / 2.2,
            ),
          ],
        ));
  }
}
