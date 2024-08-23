import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.textColor = Colors.white,
      this.buttonColor = Colors.blue,
      this.title = '',
      required this.onPress,
      this.width = 50,
      this.height = 50,
      this.loading = false,
      this.icon = const Icon(Icons.account_circle)})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
          height: height.h,
          width: width.w,
          decoration: BoxDecoration(
              color: buttonColor, borderRadius: BorderRadius.circular(10.r)),
          child: loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Center(
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 17.sp, color: Colors.white),
                  ),
                )),
    );
  }
}
