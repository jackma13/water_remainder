import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Sleeppattern extends StatefulWidget {
  const Sleeppattern({Key? key}) : super(key: key);

  @override
  State<Sleeppattern> createState() => _SleeppatternState();
}

class _SleeppatternState extends State<Sleeppattern> {
  TimeOfDay _time = TimeOfDay(hour: 6, minute: 00);
  TimeOfDay _time2 = TimeOfDay(hour: 22, minute: 00);
  void _selectTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _time,
    );
    if (newTime != null) {
      setState(() {
        _time = newTime;
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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            'Selected time: ${_time.format(context)}',
          ),
          RaisedButton(onPressed: () {
            _selectTime();
          }),
          Text(
            'Selected time: ${_time2.format(context)}',
          ),
          RaisedButton(onPressed: () {
            _selectTime2();
          }),
          RaisedButton(onPressed: () {
            routes("/PersonalInformtion", context);
          })
        ],
      ),
    );
  }
}
