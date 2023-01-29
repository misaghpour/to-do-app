import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final textController = TextEditingController();

  RxList<String> todoList = <String>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  addTask() {
    if (textController.text.isNotEmpty) {
      todoList.add(textController.text);
      textController.text = "";
    }
  }

  showInfoDialog() {
    Get.defaultDialog(
        title: 'About App',
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        content: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              'This app is developed by M. Misaghpour',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                padding: EdgeInsets.all(12),
                child: Center(
                  child: Text(
                    'OK',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
