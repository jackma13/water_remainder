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
      backgroundColor: Color.fromARGB(255, 190, 228, 251),
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
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    Text(
                      "Notification frequency",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DropdownButton(
                        elevation: 10,
                        style: heading2,
                        isExpanded: true,
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
                    ),
                    SizedBox(
                      height: heightD * 0.03,
                    ),
                    Buttton_Design(
                        ontap: () {
                          routes("/Sleeppattern", context);
                        },
                        text: "Next"),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Image.asset(
            "assets/img_12.png",
          ),
        ],
      ),
    );
  }
}
