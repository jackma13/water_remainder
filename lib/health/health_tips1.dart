import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Healthtips1 extends StatefulWidget {
  const Healthtips1({Key? key}) : super(key: key);

  @override
  State<Healthtips1> createState() => _Healthtips1State();
}

class _Healthtips1State extends State<Healthtips1> {
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
              Image.asset("assets/health1.jpg"),
              Text(
                "Children should drink enough of water.",
                style: heading,
              ),
              SizedBox(
                height: heightD * 0.02,
              ),
              Text(
                "It is critical to address water needs at young ages since growth rates are rapid. Children who don't get enough water may experience problems with immune system development, renal health, heart health, and many other organ systems.",
                style: normaltext,
                textAlign: TextAlign.center,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        routes("/Healthtips2", context);
                      },
                      child: CircleAvatar(
                          backgroundColor: AppColors.bgcolor,
                          child: Icon(
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
