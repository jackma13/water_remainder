import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class AllDrinks extends StatefulWidget {
  const AllDrinks({Key? key}) : super(key: key);

  @override
  State<AllDrinks> createState() => _AllDrinksState();
}

class _AllDrinksState extends State<AllDrinks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(widthD * 0.03),
          itemCount: watertype.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: .9,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 3),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Color.fromARGB(255, 230, 230, 230))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/${watertype[index]["img"]}",
                      height: heightD / 10,
                    ),
                    Text(
                      watertype[index]["name"],
                      style: normaltext,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
