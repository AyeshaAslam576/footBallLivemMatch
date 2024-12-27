import 'package:countdown/routes/route.dart';
import 'package:countdown/view/league.dart';
import 'package:countdown/view/home_view.dart';
import 'package:countdown/view/liningup.dart';
import 'package:countdown/view/summary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: ScreenRoutes.myPages,
      initialRoute: ScreenRoutes.home

    );
  }
}
