import 'package:flutter/material.dart';

double heightD = 0;
double widthD = 0;
int pageIndex = 0;
bool? btn1;
bool? btn2;
TextStyle normaltext = TextStyle(
  fontWeight: FontWeight.w500,
  color: Color.fromARGB(255, 44, 44, 44),
  fontSize: widthD / 25,
);
TextStyle heading = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: widthD / 20,
);
TextStyle heading2 = TextStyle(
  color: Colors.black,
  fontSize: widthD / 25,
);
TextStyle heading3 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: widthD / 25,
);
TextStyle normaltext2 = TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.white,
  fontSize: widthD / 20,
);

routes(String name, BuildContext context) {
  Navigator.pushNamed(context, name);
}

class AppColors {
  static Color bgcolor = Color.fromARGB(255, 3, 123, 220);
}

void showSnackBar(BuildContext context, value) {
  var snackBar = SnackBar(
    content: Text(value, style: TextStyle(color: Colors.white)),
    margin: EdgeInsets.all(15),
    duration: Duration(seconds: 1),
    backgroundColor: Color.fromARGB(255, 97, 96, 96),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class Buttton_Design extends StatelessWidget {
  const Buttton_Design({
    Key? key,
    required this.ontap,
    required this.text,
  }) : super(key: key);
  final Function ontap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ontap();
      },
      child: Container(
        padding: EdgeInsets.all(15),
        width: widthD / 1.2,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100), color: AppColors.bgcolor),
        child: Center(
          child: Text(
            text,
            style: normaltext2,
          ),
        ),
      ),
    );
  }
}
