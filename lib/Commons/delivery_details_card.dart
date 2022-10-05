import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';

class DeliveryDetailsCard extends StatelessWidget {
  const DeliveryDetailsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context)
        .textTheme
        .bodyText1!
        .copyWith(fontSize: 20, color: blackColor);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: yellowColor,
      child: Container(
        padding: const EdgeInsets.all(10),
        height: MediaQuery.of(context).size.height * .15,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Rice",
                  style: textStyle,
                ),
                Text(
                  "15Kg",
                  style: textStyle,
                ),
              ],
            ),
            Wrap(
              children: const [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Cooked 2 hours ago"), Icon(Icons.delete)],
            )
          ],
        ),
      ),
    );
  }
}