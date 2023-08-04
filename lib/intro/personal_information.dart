import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:numberpicker/numberpicker.dart';
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
  Widget build(BuildContext context) {
    return Scaffold(
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
                                      _currentHorizontalIntValue.toString(),
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
                                    _sliderDiscreteValue == 0
                                        ? "Low"
                                        : _sliderDiscreteValue == 50.0
                                            ? "Medium"
                                            : _sliderDiscreteValue == 100.0
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
        ));
  }
}

int _currentHorizontalIntValue = 30;

class SelectWeight extends StatefulWidget {
  const SelectWeight({Key? key}) : super(key: key);

  @override
  State<SelectWeight> createState() => _SelectWeightState();
}

class _SelectWeightState extends State<SelectWeight> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Weight",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Center(
                      child: Text(
                        "$_currentHorizontalIntValue KG",
                        style: heading3,
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    NumberPicker(
                      value: _currentHorizontalIntValue,
                      minValue: 30,
                      maxValue: 200,
                      step: 1,
                      itemHeight: 100,
                      axis: Axis.horizontal,
                      onChanged: (value) =>
                          setState(() => _currentHorizontalIntValue = value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black26),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              routes("/PersonalInformtion", context);
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

double _sliderDiscreteValue = 0;

class SelectActivity extends StatefulWidget {
  const SelectActivity({Key? key}) : super(key: key);

  @override
  State<SelectActivity> createState() => _SelectActivityState();
}

class _SelectActivityState extends State<SelectActivity> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Activicty",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Slider(
                      value: _sliderDiscreteValue,
                      min: 0,
                      max: 100,
                      divisions: 2,
                      // label: _sliderDiscreteValue.round().toString(),
                      onChanged: (value) {
                        setState(() {
                          _sliderDiscreteValue = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Low"),
                        Text("Medium"),
                        Text("High")
                      ],
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              routes("/PersonalInformtion", context);
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
