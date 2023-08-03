import 'package:flutter/material.dart';
import 'package:horizontal_picker/horizontal_picker.dart';
import 'package:water_remainder/globle_var.dart';

class PersonalInformtion extends StatefulWidget {
  const PersonalInformtion({Key? key}) : super(key: key);

  @override
  State<PersonalInformtion> createState() => _PersonalInformtionState();
}

class _PersonalInformtionState extends State<PersonalInformtion> {
  DateTime _date = DateTime(2020, 11, 17);
  double? newValue;

  void _selectDate() async {
    final DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2017, 1),
      lastDate: DateTime(2022, 7),
      helpText: 'Select a date',
    );
    if (newDate != null) {
      setState(() {
        _date = newDate;
      });
    }
  }

  void _selectweight() async {
    showDialog(
        context: context,
        builder: (context) => SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Container(
                width: 350,
                height: 420,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      HorizontalPicker(
                        minValue: -10,
                        maxValue: 55,
                        divisions: 600,
                        height: 120,
                        suffix: " cm",
                        showCursor: false,
                        backgroundColor: Colors.grey.shade900,
                        activeItemTextColor: Colors.white,
                        passiveItemsTextColor: Colors.amber,
                        onChanged: (value) {
                          setState(() {
                            newValue = value;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        ElevatedButton(
          onPressed: _selectDate,
          child: const Text('SELECT DATE'),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected date: $_date',
        ),
        ElevatedButton(
          onPressed: _selectweight,
          child: const Text('SELECT Wight'),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected Wight: $newValue',
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (_) {
                  return SelectActivity();
                });
          },
          child: const Text('SELECT Wight'),
        ),
        const SizedBox(height: 8),
        Text(
          'Selected activity: $_sliderDiscreteValue',
        ),
        RaisedButton(onPressed: () {
          routes("/SelectGender", context);
        })
      ]),
    );
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
            width: 350,
            height: 420,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: Slider(
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
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
