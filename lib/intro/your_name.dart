import 'package:flutter/material.dart';
import 'package:water_remainder/globle_var.dart';

class Yourname extends StatefulWidget {
  const Yourname({Key? key}) : super(key: key);

  @override
  State<Yourname> createState() => _YournameState();
}

class _YournameState extends State<Yourname> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return exitapp(context);
      },
      child: Scaffold(
          backgroundColor: Color(0xffddf0f6),
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: heightD * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PhysicalModel(
                    color: Colors.transparent,
                    elevation: 10,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: widthD,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            height: heightD * 0.02,
                          ),
                          Text(
                            "How should we address you?",
                            style: heading,
                          ),
                          SizedBox(
                            height: heightD * 0.05,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              key: _formKey,
                              child: TextFormField(
                                controller: namecontroller,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter Name';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Enter Your Name",
                                  fillColor: Colors.white30,
                                  filled: true,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 2),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: heightD * 0.02,
                          ),
                          Buttton_Design(
                              ontap: () {
                                if (_formKey.currentState!.validate()) {
                                  FocusScope.of(context)
                                      .requestFocus(FocusNode());
                                  databox.put("name", namecontroller.text);
                                  databox.put("vibration", true);
                                  databox.put("watergoal", 1200);
                                  databox.put("cupindex", 0);
                                  databox.put("cupml", mllist);
                                  routes("/Homenavigation", context);
                                }
                              },
                              text: "Create Plan"),
                          SizedBox(
                            height: heightD * 0.04,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Image.asset(
                  "assets/img_22.jpg",
                ),
              ],
            ),
          )),
    );
  }
}
