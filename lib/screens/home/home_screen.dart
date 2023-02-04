import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/controllers/home_controller.dart';
import 'package:to_do_list_app/data/models/task.dart';

import 'components/add_new_task_widget.dart';
import 'components/completed_task_item.dart';
import 'components/my_app_bar.dart';
import 'components/not_completed_task_item.dart';
import 'components/toggle_mode_widget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildMyAppBar(controller),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ToggleModeWidget(),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: controller.todoList.length > 0
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: !controller.isCompletedMode.value
                              ? [
                                  for (Task task in controller.notCompletedList)
                                    NotCompletedTaskItem(
                                      task: task,
                                    ),
                                ]
                              : [
                                  for (Task task in controller.completedList)
                                    CompletedTaskItem(
                                      task: task,
                                    ),
                                ],
                        ),
                      )
                    : SizedBox(),
              ),
              !controller.isCompletedMode.value
                  ? AddNewTaskWidget()
                  : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}

