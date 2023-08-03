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
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
              "Your Urine Color gives inforamtion about your hydration status"),
          Row(
            children: [
              Text(
                "Enable notification",
              ),
              Transform.scale(
                scale: 1.5,
                child: Switch(
                  // This bool value toggles the switch.
                  value: toggle,
                  activeTrackColor: Colors.black,
                  inactiveThumbColor: Colors.white,
                  activeColor: Colors.white,
                  // activeColor: Colors.green,
                  onChanged: (bool value) {
                    // This is called when the user toggles the switch.
                    toggle = !toggle;
                    setState(() {});
                  },
                ),
              )
            ],
          ),
          RaisedButton(onPressed: () {
            routes("/SelectTemperature", context);
          })
        ],
      ),
    );
  }
}
