import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/controllers/home_controller.dart';
import 'package:to_do_list_app/data/models/task.dart';

import 'components/completed_task_item.dart';
import 'components/not_completed_task_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To Do App',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                controller.showInfoDialog();
              },
              child: Icon(
                Icons.info_outline,
                color: Colors.blue,
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
          child: Obx(
        () => Container(
          padding: EdgeInsets.all(16),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Row(children: [
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
                ]),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: controller.todoList.length > 0 ? SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: !controller.isCompletedMode.value
                        ? [
                            for (Task task in controller.todoList)
                              NotCompletedTaskItem(taskStr: task.title),
                          ]
                        : [
                            for (Task task in controller.todoList)
                              CompletedTaskItem(taskStr: task.title),
                          ],
                  ),
                ) : SizedBox(),
              ),
              !controller.isCompletedMode.value
                  ? Container(
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
                    )
                  : SizedBox()
            ],
          ),
        ),
      )),
    );
  }
}
