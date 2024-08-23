import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    this.title = '',
    this.detail = '',
    this.width = 50,
    this.height = 50,
    this.loading = false,
  }) : super(key: key);

  final bool loading;
  final String title;
  final String detail;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 75.h,
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10.sp, 7.sp, 10.sp, 5.sp),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 3,
              child: Text(title,
                  style:
                      TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 1,
              child: Text(detail,
                  textAlign: TextAlign.right,
                  style:
                      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
