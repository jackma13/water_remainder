import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_remainder/globle_var.dart';
import 'package:water_remainder/notification_service.dart';

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
              onTap: () {
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    elevation: 0,
                    context: context,
                    builder: (context) {
                      return DrinkData(
                        index: index,
                      );
                    });
              },
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

class DrinkData extends StatelessWidget {
  const DrinkData({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widthD * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: heightD * 0.03,
          ),
          Text(
            watertype[index]["name"],
            style: heading,
          ),
          SizedBox(
            height: heightD * 0.02,
          ),
          Row(
            children: [
              Text(
                "Cup",
                style: normaltext.copyWith(fontSize: widthD / 22),
              ),
              const Expanded(child: SizedBox()),
              Text(
                "$drinkml ml",
                style: normaltext.copyWith(fontSize: widthD / 22),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                    showDialog(
                        context: context,
                        builder: (_) {
                          return DrinkMl(index: index);
                        });
                  },
                  icon: Icon(Icons.arrow_forward_ios))
            ],
          ),
          SizedBox(
            height: heightD * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Hydration Rate",
                style: normaltext.copyWith(fontSize: widthD / 22),
              ),
              Text(
                "${watertype[index]["hydration"]} %",
                style: normaltext.copyWith(fontSize: widthD / 22),
              )
            ],
          ),
          SizedBox(
            height: heightD * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Caffeine",
                style: normaltext.copyWith(fontSize: widthD / 22),
              ),
              Text(
                "${watertype[index]["caffeine"]} mg",
                style: normaltext.copyWith(fontSize: widthD / 22),
              )
            ],
          ),
          SizedBox(
            height: heightD * 0.05,
          ),
          Buttton_Design(
              ontap: () async {
                Vibrate.vibrate();
                await localnotificationservice().quizenotification();
                databox.put(
                    "totaldrink", totaldrink + mllist[databox.get("cupindex")]);
                totaldrink = databox.get("totaldrink");
                databox.put("time", dates);

                Navigator.pop(context);
              },
              text: "Drink Now"),
          SizedBox(
            height: heightD * 0.05,
          ),
        ],
      ),
    );
  }
}

int drinkml = 200;

class DrinkMl extends StatefulWidget {
  const DrinkMl({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  State<DrinkMl> createState() => _DrinkMlState();
}

class _DrinkMlState extends State<DrinkMl> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Container(
            width: widthD / 1.3,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Material(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              child: Padding(
                padding: EdgeInsets.all(widthD * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "Select Water Goal",
                      style: heading,
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Center(
                      child: Text(
                        "$drinkml Ml",
                        style: heading3,
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.02,
                    ),
                    NumberPicker(
                      value: drinkml,
                      minValue: 200,
                      maxValue: 100000,
                      step: 10,
                      itemHeight: 100,
                      axis: Axis.horizontal,
                      onChanged: (value) => setState(() => drinkml = value),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.black26),
                      ),
                    ),
                    SizedBox(
                      height: heightD * 0.05,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  elevation: 0,
                                  context: context,
                                  builder: (context) {
                                    return DrinkData(
                                      index: widget.index,
                                    );
                                  });
                            },
                            child: const Text("Cancle")),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              showModalBottomSheet(
                                  backgroundColor: Colors.white,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20))),
                                  elevation: 0,
                                  context: context,
                                  builder: (context) {
                                    return DrinkData(
                                      index: widget.index,
                                    );
                                  });
                            },
                            child: const Text("Okay"))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
