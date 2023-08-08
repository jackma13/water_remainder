import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:water_remainder/globle_var.dart';

class Allcup extends StatefulWidget {
  const Allcup({Key? key}) : super(key: key);

  @override
  State<Allcup> createState() => _AllcupState();
}

class _AllcupState extends State<Allcup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.all(widthD * 0.03),
          itemCount: glasstype.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10, mainAxisSpacing: 10, crossAxisCount: 2),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                indexs = index;
                showModalBottomSheet(
                    backgroundColor: Colors.white,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    elevation: 0,
                    context: context,
                    builder: (context) {
                      return Changeml();
                    });
                setState(() {});
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color: databox.get("cupindex") == index
                            ? AppColors.bgcolor
                            : const Color.fromARGB(255, 230, 230, 230))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      "assets/${glasstype[index]["img"]}",
                      height: heightD / 8,
                    ),
                    Text(
                      glasstype[index]["name"],
                      style: heading4,
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      "${mllist[index]} ml",
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

int indexs = 0;

class Changeml extends StatefulWidget {
  const Changeml({Key? key}) : super(key: key);

  @override
  State<Changeml> createState() => _ChangemlState();
}

class _ChangemlState extends State<Changeml> {
  int values = mllist[indexs];
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
            glasstype[indexs]["name"],
            style: heading4,
          ),
          SizedBox(
            height: heightD * 0.02,
          ),
          NumberPicker(
            value: values,
            minValue: 25,
            maxValue: 500,
            step: 5,
            itemHeight: 100,
            axis: Axis.horizontal,
            onChanged: (value) => setState(() {
              values = value;
            }),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.black26),
            ),
          ),
          SizedBox(
            height: heightD * 0.05,
          ),
          Buttton_Design(
              ontap: () {
                setState(() {});
                mllist.removeAt(indexs);
                mllist.insert(indexs, values);
                databox.put("cupindex", indexs);
                databox.put("cupml", mllist);
                routes("/Allcup", context);
              },
              text: "Save cup"),
          SizedBox(
            height: heightD * 0.05,
          ),
        ],
      ),
    );
  }
}
