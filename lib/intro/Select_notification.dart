import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class SelectNotification extends StatefulWidget {
  const SelectNotification({Key? key}) : super(key: key);

  @override
  State<SelectNotification> createState() => _SelectNotificationState();
}

class _SelectNotificationState extends State<SelectNotification> {
  String dropdownvalue = 'Every 30 Minutes';
  var items = [
    'Every 30 Minutes',
    'Every 1 Hours',
    'Every 2 Hours',
    'Every 4 Hours',
    'Every 6 Hours',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          DropdownButton(
            value: dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropdownvalue = newValue!;
              });
            },
          ),
          RaisedButton(onPressed: () {
            routes("/Sleeppattern", context);
          })
        ],
      ),
    );
  }
}
