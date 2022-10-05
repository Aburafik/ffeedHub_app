import 'package:feather_icons/feather_icons.dart';
import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class DonateFood extends StatefulWidget {
  DonateFood({super.key});

  @override
  State<DonateFood> createState() => _DonateFoodState();
}

class _DonateFoodState extends State<DonateFood> {
  TextEditingController foodNameController = TextEditingController();

  TextEditingController foodQuantityController = TextEditingController();

  TextEditingController moreInforController = TextEditingController();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Donate Food",
          style: Theme.of(context)
              .textTheme
              .bodyText1!
              .copyWith(color: blackColor, fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                color: yellowColor,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 5,
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15),
                          ),
                          image: DecorationImage(
                              image: AssetImage("images/oph.jpeg"),
                              fit: BoxFit.cover),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("NGO Name"),
                            const Text("123 meals "),
                            Row(
                              children: const [
                                Icon(
                                  FeatherIcons.mapPin,
                                  size: 20,
                                  color: blackColor,
                                ),
                                Text("20km")
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ExpansionTile(
                  tilePadding: EdgeInsets.zero,
                  expandedCrossAxisAlignment: CrossAxisAlignment.start,
                  expandedAlignment: Alignment.topLeft,
                  title: Text(
                    "Diet Type",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 18),
                  ),
                  children: [
                    RadioListTile(
                      value: "Vega",
                      groupValue: selectedValue,
                      title: const Text("Vega"),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    RadioListTile(
                      value: "Vegitable",
                      groupValue: selectedValue,
                      title: const Text("Vegitable"),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    ),
                    RadioListTile(
                      value: "Non Veg",
                      groupValue: selectedValue,
                      title: const Text("Non Veg"),
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                    )
                  ],
                ),
              ),
              CommonTextField(
                hintText: "Enter food name",
                controller: foodNameController,
              ),
              CommonTextField(
                hintText: "Enter quantity (in kg)",
                controller: foodQuantityController,
              ),
              CommonTextField(
                hintText: "Any other infor",
                controller: moreInforController,
              ),
              CustomButtonComponent(
                buttonText: "Comtinue",
                onPressed: () {
                  Navigator.pushNamed(context, "/donate-details-view");
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CommonTextField extends StatelessWidget {
  const CommonTextField({Key? key, this.hintText, this.controller})
      : super(key: key);

  final TextEditingController? controller;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          fillColor: lightGreyColor,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
