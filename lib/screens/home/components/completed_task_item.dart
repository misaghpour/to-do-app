import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/home_controller.dart';

class CompletedTaskItem extends StatelessWidget {
  CompletedTaskItem({
    Key? key,
    required this.taskStr,
  }) : super(key: key);

  final String taskStr;
  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.blue, width: 1.5)),
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            children: [
              Checkbox(
                  value: true,
                  onChanged: (value) {
                    // should be change
                  }),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    taskStr,
                    style: TextStyle(fontSize: 20, decoration: TextDecoration.lineThrough, color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.editTask();
                },
                child: Icon(
                  Icons.edit_outlined,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.deleteTask();
                },
                child: Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                  size: 32,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        )
      ],
    );
  }
}
