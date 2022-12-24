import 'package:ffeed_hub/Commons/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

PhoneAuthProvider phoneAuthProvider = PhoneAuthProvider();

class Authprovider extends ChangeNotifier {
  final bool _isLogIn = false;

  get isLogIn => _isLogIn;

  verifyPhone({String? phoneNumber, BuildContext? context}) async {
    startLoading();
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      codeSent: (String verificationId, int? resendToken) {
        print(
            "########################## The code has been send to the device######################################");

        Navigator.pushNamed(context!, "/code-verification-view",
            arguments: [verificationId, phoneNumber]);
        stopLoading();
      },
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance.signInWithCredential(credential);
        stopLoading();
      },
      timeout: Duration(seconds: 30),
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          stopLoading();
          showToast(
              msg: 'The provided phone number is not valid.',
              color: Colors.red);
        }
      },
      codeAutoRetrievalTimeout: (String timeOut) {
        stopLoading();
        showToast(
            msg: "Code retrieval timeout, please try again", color: Colors.red);
      },
    );

    notifyListeners();
  }

  verifyOTP(
      {String? verificationId, String? smsCode, BuildContext? context}) async {
    startLoading();
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!, smsCode: smsCode!);

    await FirebaseAuth.instance
        .signInWithCredential(credential)
        .then((userCredential) {
      print("Verification Completed Successfully");
      final user = userCredential.user!.uid;
      print(user);
      Navigator.pushNamed(context!, "/choose-role");
    });

    stopLoading();

    notifyListeners();
  }

  resendToken() {}
}


