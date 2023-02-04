import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/data/models/task.dart';

import '../../../controllers/home_controller.dart';

class CompletedTaskItem extends StatelessWidget {
  CompletedTaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;
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
                  value: task.isCompleted,
                  onChanged: (value) {
                    controller.toggleNoteDoneTask(task);
                  }),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: Text(
                    task.title,
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                onTap: () {
                  controller.editTask(task);
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
                  controller.deleteTask(task);
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
