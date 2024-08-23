import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:rafay_dairies_and_farms/src/Dashboard/dashboardProvider.dart';
import 'package:rafay_dairies_and_farms/src/login/login.dart';

void main() {
  runApp(
    ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DashboardProvider()),
      ],
      child: MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context) ?? const Locale('en', 'US'),
        builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
        title: "Rafay Diaries and Farms",
        home: Login(),
      ),
    );
  }
}
