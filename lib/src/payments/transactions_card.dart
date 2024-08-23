import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafay_dairies_and_farms/core/utils/utils.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({
    Key? key,
    required this.transaction,
    this.tr = 0,
    this.Balance = 0,
    this.Company = '',
    this.date = '',
  }) : super(key: key);
  final String transaction;
  final double tr;
  final double Balance;
  final String Company;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(6.sp, 4.sp, 6.sp, 3.sp),
        child: Column(
          children: [
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  transaction,
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  tr.toString(),
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
                  'Company',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  Company,
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
                  'Balance',
                  style: TextStyle(
                      fontSize: Utils.titleFontSize.sp,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  Balance.toString(),
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
