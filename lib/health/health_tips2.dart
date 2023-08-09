import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Healthtips2 extends StatefulWidget {
  const Healthtips2({Key? key}) : super(key: key);

  @override
  State<Healthtips2> createState() => _Healthtips2State();
}

class _Healthtips2State extends State<Healthtips2> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        routes("/Homenavigation", context);
         return Future.value(true);
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/health2.jpg"),
              Text(
                "Avoid consuming unneeded calories.",
                style: heading,
              ),
              SizedBox(
                height: heightD * 0.02,
              ),
              Text(
                "Make sure not to add sugar, cream, etc. to your child's milk, tea, or coffee because doing so could lead to weight gain and other negative health implications.",
                style: normaltext,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        routes("/Healthtips3", context);
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColors.bgcolor,
                          child: const Icon(
                            Icons.arrow_forward_ios,
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
