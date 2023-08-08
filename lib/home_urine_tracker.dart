import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class HomeUrinetacker extends StatefulWidget {
  const HomeUrinetacker({Key? key}) : super(key: key);

  @override
  State<HomeUrinetacker> createState() => _HomeUrinetackerState();
}

class _HomeUrinetackerState extends State<HomeUrinetacker> {
  @override
  void initState() {
    databox.get("urineindex") == null
        ? totaldrink = 0
        : urineindex = databox.get("urineindex");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Urine Tracker",
          style: heading4,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: heightD * 0.04,
              ),
              Text(
                  "You can evalute weather you are drinking enough water r not by using the urine color chart",
                  style: normaltext,
                  textAlign: TextAlign.center),
              SizedBox(
                height: heightD * 0.04,
              ),
              urineindex != null
                  ? Column(
                      children: [
                        Image(
                          image: AssetImage(urinelist[urineindex!]["image"]),
                          height: heightD / 5,
                        ),
                        SizedBox(
                          height: heightD * 0.02,
                        ),
                        Text(
                          urinelist[urineindex!]["type"],
                          style: heading.copyWith(fontSize: widthD / 18),
                        ),
                        SizedBox(
                          height: heightD * 0.01,
                        ),
                        Text(
                          urinelist[urineindex!]["dis"],
                          style: normaltext,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: heightD * 0.01,
                        ),
                      ],
                    )
                  : const SizedBox(),
              GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.all(widthD * 0.03),
                  itemCount: urinelist.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        urineindex = index;
                        databox.put("urineindex", index);
                        setState(() {});
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 2,
                                color: urineindex == index
                                    ? Colors.black
                                    : Colors.white),
                            color: urinelist[index]["color"],
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: urineindex == index
                              ? Icon(
                                  Icons.check,
                                  size: widthD / 12,
                                )
                              : const SizedBox()),
                    );
                  }),
              SizedBox(
                height: heightD * 0.04,
              ),
              Buttton_Design(ontap: () {}, text: "Save Color"),
              SizedBox(
                height: heightD * 0.04,
              ),
              Text(
                  "Be aware that certain foods, medications and vitamin supplements can also change the color of your urine",
                  style: normaltext.copyWith(fontSize: widthD / 22),
                  textAlign: TextAlign.center),
              SizedBox(
                height: heightD * 0.04,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
