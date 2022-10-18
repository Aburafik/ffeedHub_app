import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class PickupTimeSelectorComponent extends StatelessWidget {
  const PickupTimeSelectorComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: TextField(
      // keyboardType: TextInputType.number,
      decoration: InputDecoration(
          hintText: "Mnt",
          filled: true,
          fillColor: lightGreyColor,
          contentPadding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.03),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    ));
  }
}
