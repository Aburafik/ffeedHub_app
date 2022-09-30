import 'package:ffeed_hub/Commons/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';

CircleAvatar appLogo(BuildContext context) {
  return CircleAvatar(
    backgroundColor: primaryColor,
    radius: 50,
    child: Text("OMP",
        style: Theme.of(context).textTheme.bodyText1!.copyWith(
            fontSize: 30, fontWeight: FontWeight.bold, color: whiteColor)),
  );
}

showToast({String? msg, Color? color}) {
  return Fluttertoast.showToast(
      msg: msg!,
      gravity: ToastGravity.TOP,
      backgroundColor: color ?? Colors.green,
      // textColor: Colors.white,
      fontSize: 16.0);
}

startLoading() {
  return EasyLoading.show(
    // status: "Signing Up...",
    maskType: EasyLoadingMaskType.black,
  );
}

stopLoading() {
  return EasyLoading.dismiss();
}
