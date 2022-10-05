import 'package:flutter/material.dart';

class TimeZoneSelectorComponent extends StatelessWidget {
  TimeZoneSelectorComponent({Key? key, this.title, this.onTap, this.selectedColor})
      : super(key: key);

  String? title;
  Function()? onTap;
  Color? selectedColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Material(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: selectedColor,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Text(title!),
          )),
    );
  }
}
