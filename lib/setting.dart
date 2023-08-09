import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:water_remainder/globle_var.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  bool toggle = true;
  bool vibration = true;
  DateTime _date = DateTime.now();
  String date2 = DateFormat('MM-dd-yyyy').format(DateTime.now()).toString();
  TimeOfDay _time = const TimeOfDay(hour: 6, minute: 00);
  TimeOfDay _time2 = const TimeOfDay(hour: 22, minute: 00);

  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
        databox.put("wakeup", _time.format(context));
      });
    }
  }

  void _selectTime2() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time2,
    );
    if (newTime != null) {
      setState(() {
        _time2 = newTime;
        databox.put("bedtime", _time2.format(context));
      });
    }
  }

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
        databox.put("birthday", _date);
      });
    }
  }

  @override
  void initState() {
    _time =
        TimeOfDay.fromDateTime(DateFormat.jm().parse(databox.get("wakeup")));
    _time2 =
        TimeOfDay.fromDateTime(DateFormat.jm().parse(databox.get("bedtime")));
    watergoal = databox.get("watergoal");
    toggle = databox.get("urinetracker");
    vibration = databox.get("vibration");
    _date = databox.get("birthday");
    databox.get("notifiaction") == 30
        ? dropdownvalue = items[0]
        : databox.get("notifiaction") == 60
            ? dropdownvalue = items[1]
            : databox.get("notifiaction") == 120
                ? dropdownvalue = items[2]
                : databox.get("notifiaction") == 240
                    ? dropdownvalue = items[3]
                    : databox.get("notifiaction") == 360
                        ? dropdownvalue = items[4]
                        : dropdownvalue = items[4];
    sliderDiscreteValue = databox.get("activity");
    currentHorizontalIntValue = databox.get("Weight");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var divider = const Padding(
      padding: EdgeInsets.all(8.0),
      child: Divider(
        thickness: 1,
      ),
    );
    var icon = const Icon(
      Icons.arrow_forward_ios_outlined,
      size: 20,
    );
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 221, 220, 220),
        appBar: AppBar(
          title: Text(
            "Setting",
            style: heading,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: heightD * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Personal Setting",
                  style: normaltext.copyWith(color: AppColors.bgcolor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          _selectDate();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Birthday",
                              style: heading4,
                            ),
                            const Expanded(child: const SizedBox()),
                            Text(
                              "${DateFormat('dd-mm-yyyy').format(databox.get("birthday"))} ",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      ),
                      divider,
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return const SelectWeight();
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              "Weight",
                              style: heading4,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "${databox.get("Weight")} kg ",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      ),
                      divider,
                      InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return const WaterGoals();
                              });
                        },
                        child: Row(
                          children: [
                            Text(
                              "Water Goal",
                              style: heading4,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "${databox.get("watergoal")} ml ",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      ),
                      divider,
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
                              "Activity",
                              style: heading4,
                            ),
                            const Expanded(child: const SizedBox()),
                            Text(
                              sliderDiscreteValue == 0
                                  ? "Low"
                                  : sliderDiscreteValue == 50.0
                                      ? "Medium"
                                      : sliderDiscreteValue == 100.0
                                          ? "High"
                                          : "High",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      ),
                      divider,
                      InkWell(
                        onTap: () {
                          _selectTime();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Wake-up Time",
                              style: heading4,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "${databox.get("wakeup")}",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      ),
                      divider,
                      InkWell(
                        onTap: () {
                          _selectTime2();
                        },
                        child: Row(
                          children: [
                            Text(
                              "Bedtime",
                              style: heading4,
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              "${databox.get("bedtime")}",
                              style: heading4,
                            ),
                            icon
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Notification Setting",
                  style: normaltext.copyWith(color: AppColors.bgcolor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Notification frequency",
                            style: heading4,
                          ),
                          Expanded(child: SizedBox()),
                          DropdownButton(
                            underline: SizedBox(),
                            style: heading4,
                            value: dropdownvalue,
                            icon: const Icon(Icons.arrow_forward_ios_outlined),
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                databox.put(
                                    "notifiaction",
                                    dropdownvalue == "Every 30 Minutes"
                                        ? 30
                                        : dropdownvalue == "Every 1 Hours"
                                            ? 60
                                            : dropdownvalue == "Every 2 Hours"
                                                ? 120
                                                : dropdownvalue ==
                                                        "Every 4 Hours"
                                                    ? 240
                                                    : dropdownvalue ==
                                                            'Every 6 Hours'
                                                        ? 360
                                                        : 30);
                              });
                            },
                          ),
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Text(
                            "Urine Tracker",
                            style: heading4,
                          ),
                          const Expanded(child: SizedBox()),
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                              value: toggle,
                              activeTrackColor: AppColors.bgcolor,
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
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "App Setting",
                  style: normaltext.copyWith(color: AppColors.bgcolor),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "App Vibration",
                            style: heading4,
                          ),
                          const Expanded(child: SizedBox()),
                          Transform.scale(
                            scale: 1.5,
                            child: Switch(
                              value: vibration,
                              activeTrackColor: AppColors.bgcolor,
                              inactiveThumbColor: Colors.white,
                              activeColor: Colors.white,
                              // activeColor: Colors.green,
                              onChanged: (bool value) {
                                vibration = !vibration;
                                databox.put("vibration", vibration);
                                setState(() {});
                              },
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: heightD * 0.02,
                      ),
                      Row(
                        children: [
                          Text(
                            "Terms of use",
                            style: heading4,
                          ),
                          const Expanded(child: const SizedBox()),
                          icon
                        ],
                      ),
                      divider,
                      Row(
                        children: [
                          Text(
                            "Privacy Policy",
                            style: heading4,
                          ),
                          const Expanded(child: const SizedBox()),
                          icon
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heightD * 0.05,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
