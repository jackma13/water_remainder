import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Healthtips3 extends StatefulWidget {
  const Healthtips3({Key? key}) : super(key: key);

  @override
  State<Healthtips3> createState() => _Healthtips3State();
}

class _Healthtips3State extends State<Healthtips3> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        routes("/Homenavigation", context);
        return Future.value(true);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/health3.jpg"),
              SizedBox(
                height: heightD * 0.02,
              ),
              Text(
                "Don't let your kid wait till they're thirsty!",
                style: heading,
              ),
              SizedBox(
                height: heightD * 0.02,
              ),
              Text(
                "Do not wait until your child is dehydrated before giving them water. because thirst does not become apparent until the body has lost 2% of its water weight in water.",
                style: normaltext,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        routes("/Homenavigation", context);
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColors.bgcolor,
                          child: const Icon(
                            Icons.home,
                            color: Colors.white,
                          ))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
