import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/core/dependency_injections/dependency_injection.dart';
import 'app/routes/app_pages.dart';

void main() {
  DependencyInjection.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bhola Trading",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
