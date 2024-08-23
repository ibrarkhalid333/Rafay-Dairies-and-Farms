import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafay_dairies_and_farms/core/utils/utils.dart';

class ExpenseCard extends StatelessWidget {
  const ExpenseCard({
    Key? key,
    required this.id,
    this.amount = 0,
    this.description = '',
    this.date = '',
  }) : super(key: key);
  final int id;
  final String description;
  final double amount;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(5.sp, 3.sp, 5.sp, 2.sp),
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
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Amount',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  amount.toString(),
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Desciption',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: Utils.detailFontSize.sp,
                      fontWeight: FontWeight.w500),
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
