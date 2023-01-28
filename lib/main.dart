import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To Do App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Routes.WELCOME,
      getPages: AppPages.pages,
      defaultTransition: Transition.fade,
    );
  }
}

