import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class ToggleModeWidget extends StatelessWidget {
  ToggleModeWidget({
    super.key,
  });

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: InkWell(
        onTap: () {
          controller.isCompletedMode.value = false;
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: !controller.isCompletedMode.value
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              'Not Completed',
              style: TextStyle(
                  fontWeight: !controller.isCompletedMode.value
                      ? FontWeight.bold
                      : FontWeight.normal,
                  fontSize: 18,
                  color: !controller.isCompletedMode.value
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      )),
      SizedBox(
        width: 5,
      ),
      Expanded(
          child: InkWell(
        onTap: () {
          controller.isCompletedMode.value = true;
        },
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: controller.isCompletedMode.value
                  ? Colors.blue
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: Text(
              'Completed',
              style: TextStyle(
                  color: controller.isCompletedMode.value
                      ? Colors.white
                      : Colors.black,
                  fontSize: 18,
                  fontWeight: controller.isCompletedMode.value
                      ? FontWeight.bold
                      : FontWeight.normal),
            ),
          ),
        ),
      )),
    ]);
  }
}