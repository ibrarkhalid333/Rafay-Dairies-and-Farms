import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static int titleFontSize = 20;
  static int detailFontSize = 16;
  static void fieldFocusChange(
      BuildContext context, FocusNode currunt, FocusNode nextFocus) {
    currunt.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      timeInSecForIosWeb: 5,
    );
  }

  static void ShowSnackBar(BuildContext context, title, String message) {
    final snackBar = SnackBar(
      content: Center(
        child: Text(message),
      ),
      backgroundColor: Colors.green[500],
      duration: Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static void ErrrorSnackBar(BuildContext context, title, String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
