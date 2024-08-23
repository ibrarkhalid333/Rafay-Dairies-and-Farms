import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rafay_dairies_and_farms/src/AppUrl/app_url.dart';
import 'package:rafay_dairies_and_farms/src/Dashboard/cards.dart';
import 'package:rafay_dairies_and_farms/src/Dashboard/dashboardProvider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initialize();
    _startTimer();
  }

  Future<void> _initialize() async {
    final provider = Provider.of<DashboardProvider>(context, listen: false);
    await provider.settoken();
    await provider.fetchDashboardData(AppUrl.DashboardApi,
        token: provider.token);
    if (provider.dashboardModel?.data != null) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _startTimer() {
    Timer(const Duration(seconds: 10), () {
      if (_isLoading) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardProvider>(
      builder: (context, provider, child) {
        final data = provider.dashboardModel?.data;
        if (_isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (data != null) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Cards(
                  title: 'Total Vendor',
                  detail: data.totalVendor.toString(),
                ),
                SizedBox(height: 10.h),
                Cards(
                  title: 'Total Customer',
                  detail: data.totalCustomer.toString(),
                ),
                SizedBox(height: 10.h),
                Cards(
                  title: 'Total Balance',
                  detail: data.totalBalance.toString(),
                ),
                SizedBox(height: 10.h),
                Cards(
                  title: 'Total Receivable Amount',
                  detail: data.totalReceivableAmount.toString(),
                ),
                SizedBox(height: 10.h),
                Cards(
                  title: 'Total Payable Amount',
                  detail: data.totalPayableAmount.toString(),
                ),
                SizedBox(height: 10.h),
                Cards(
                  title: 'Total Available Stock',
                  detail: data.totalAvailableStock.toString(),
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('No data available.'));
        }
      },
    );
  }
}
