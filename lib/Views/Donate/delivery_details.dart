import 'package:ffeed_hub/Commons/Components/custom_button.dart';
import 'package:ffeed_hub/Commons/Components/pickup_time_component.dart';
import 'package:ffeed_hub/Commons/Components/time_zone_selector.dart';
import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:ffeed_hub/Commons/Components/delivery_details_card.dart';
import 'package:flutter/material.dart';

class DonateFoodDetails extends StatefulWidget {
  const DonateFoodDetails({super.key});

  @override
  State<DonateFoodDetails> createState() => _DonateFoodDetailsState();
}

class _DonateFoodDetailsState extends State<DonateFoodDetails> {
  String? selectedValue;

  String? selectedTimeZone;

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(color: blackColor, fontSize: 20);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Delivery",
          style: textStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text("Food Details",
                    style: textStyle.copyWith(fontWeight: FontWeight.bold)),
              ),
               DeliveryDetailsCard(onTap: (){},),
              const SizedBox(height: 50),
              Text(
                "Delivery Type",
                style: textStyle.copyWith(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                activeColor: primaryColor,
                contentPadding: EdgeInsets.zero,
                value: "Self",
                groupValue: selectedValue,
                title: Text(
                  "Self",
                  style: textStyle,
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              RadioListTile(
                activeColor: primaryColor,
                contentPadding: EdgeInsets.zero,
                value: "Pick Up",
                groupValue: selectedValue,
                title: Text(
                  "Pick Up",
                  style: textStyle,
                ),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "Delivery Time",
                  style: textStyle.copyWith(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    const PickupTimeSelectorComponent(),
                    Text(
                      ":",
                      style: textStyle.copyWith(
                          fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const PickupTimeSelectorComponent(),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        TimeZoneSelectorComponent(
                          selectedColor: selectedTimeZone == "AM"
                              ? primaryColor
                              : lightGreyColor,
                          title: "AM",
                          onTap: () {
                            setState(() => selectedTimeZone = "AM");
                          },
                        ),
                        const SizedBox(height: 5),
                        TimeZoneSelectorComponent(
                          selectedColor: selectedTimeZone == "PM"
                              ? primaryColor
                              : lightGreyColor,
                          title: "PM",
                          onTap: () {
                            setState(() => selectedTimeZone = "PM");
                          },
                        ),
                      ],
                    ),
                    const SizedBox(width: 200)
                  ],
                ),
              ),
              const SizedBox(height: 50),
              CustomButtonComponent(
                buttonText: "CONFIRM",
                onPressed: () {
                  Navigator.pushNamed(context, "/successMesssage");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

    


//https://www.behance.net/gallery/146348903/UX-Portfolio-School-Management?tracking_source=search_projects%7Cschool%20mobile%20app%20management