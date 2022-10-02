   import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({Key? key, this.label, this.onTap, this.icon}) : super(key: key);
  String? label;

  IconData? icon;

  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(label!),
          leading: Icon(icon),
          onTap: onTap,
        ),
        const Divider(),
      ],
    );
  }
}
