import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_api/controller.dart';
import 'package:getx_api/view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      getPages: Routes.routes,
    );
  }
}

class Routes{
  static final routes = [
    GetPage(
      name: '/home',
      page: () => Home(),
    ),
    GetPage(
      name: '/data',
      page: () => Data(),
      binding: DataBinding(),
    ),
  ];
}
