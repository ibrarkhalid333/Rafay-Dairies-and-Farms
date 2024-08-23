import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafay_dairies_and_farms/core/utils/utils.dart';

class Productcard extends StatelessWidget {
  const Productcard({
    Key? key,
    required this.id,
    this.type = '',
    this.ty = '',
    this.total = 0,
    this.date = '',
  }) : super(key: key);
  final int id;
  final String type;
  final String ty;
  final double total;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(10.sp, 5.sp, 10.sp, 3.sp),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'ID',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  id.toString(),
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  type,
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  ty,
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  total.toString(),
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Date',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  date,
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
