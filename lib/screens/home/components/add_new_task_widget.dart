import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class AddNewTaskWidget extends StatelessWidget {
  AddNewTaskWidget({
    super.key,
  });

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Row(
          children: [
            Expanded(
                child: TextField(
              decoration: InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
              style: TextStyle(fontSize: 20),
              controller: controller.textController,
            )),
            SizedBox(
              width: 8,
            ),
            InkWell(
              onTap: () {
                controller.addTask();
              },
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.all(Radius.circular(50))),
                child: Text(
                  ' + ',
                  style: TextStyle(
                      fontSize: 30, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      );
  }
}
