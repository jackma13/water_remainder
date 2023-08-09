import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_remainder/globle_var.dart';

class PersonalInformtion extends StatefulWidget {
  const PersonalInformtion({Key? key}) : super(key: key);

  @override
  State<PersonalInformtion> createState() => _PersonalInformtionState();
}

class _PersonalInformtionState extends State<PersonalInformtion> {
  DateTime _date = DateTime.now();
  String date2 = DateFormat('MM-dd-yyyy').format(DateTime.now()).toString();

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1900),
      lastDate: DateTime(2030),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
        date2 = DateFormat('MM-dd-yyyy').format(newDate);
      });
    }
  }

  @override
  void initState() {
    edit = true;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: const Color(0xffffc355),
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
                          "Personal Information",
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
                              Text(
                                "Birthday",
                                style: heading3,
                              ),
                              InkWell(
                                onTap: _selectDate,
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        date2.toString(),
                                        style: heading2,
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Weight",
                                style: heading3,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const SelectWeight();
                                      });
                                  setState(() {});
                                },
                                child: Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        currentHorizontalIntValue.toString(),
                                        style: heading2,
                                      ),
                                      const Icon(Icons.arrow_drop_down)
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Activity",
                                style: heading3,
                              ),
                              InkWell(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return const SelectActivity();
                                      });
                                },
                                child: Row(
                                  children: [
                                    Text(
                                      sliderDiscreteValue == 0
                                          ? "Low"
                                          : sliderDiscreteValue == 50.0
                                              ? "Medium"
                                              : sliderDiscreteValue == 100.0
                                                  ? "High"
                                                  : "High",
                                      style: heading2,
                                    ),
                                    const Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Buttton_Design(
                            ontap: () {
                              edit = false;
                              databox.put("birthday", _date);
                              databox.put("activity", sliderDiscreteValue);
                              databox.put("Weight", currentHorizontalIntValue);
                              routes("/SelectGender", context);
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
                "assets/img_14.jpg",
                height: heightD / 2,
              ),
            ],
          )),
    );
  }
}
