import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:to_do_list_app/data/models/task.dart';
import 'package:uuid/uuid.dart';

class HomeController extends GetxController {
  final textController = TextEditingController();

  RxList<Task> todoList = <Task>[].obs;
  RxBool isCompletedMode = false.obs;

  RxList<Task> get notCompletedList {
    RxList<Task> list = <Task>[].obs;
    for (int i = 0; i < todoList.length; i++) {
      if (!todoList[i].isCompleted) {
        list.add(todoList[i]);
      }
    }
    return list;
  }

  RxList<Task> get completedList {
    RxList<Task> list = <Task>[].obs;
    for (int i = 0; i < todoList.length; i++) {
      if (todoList[i].isCompleted) {
        list.add(todoList[i]);
      }
    }
    return list;
  }

  @override
  void onInit() {
    _initData();
    super.onInit();
  }

  _initData() async {
    Box box = await Hive.openBox("todo_db");

    var itemListCache = box.get("list");
    if (itemListCache != null) {
      RxList<Task> taskList = List<Task>.from(itemListCache).obs;
      todoList.addAll(taskList);
    }
  }

  addTask() {
    if (textController.text.isNotEmpty) {
      var uuid = Uuid();
      final newTask =
          Task(title: textController.text, date: DateTime.now(), id: uuid.v4());
      todoList.add(newTask);
      refreshCache();
      textController.text = "";
    }
  }

  toggleDoneTask(Task task) {
    final index = todoList.indexWhere((element) => element.id == task.id);
    todoList[index].isCompleted = true;
    todoList.refresh();
    refreshCache();
  }

  toggleNoteDoneTask(Task task) {
    final index = todoList.indexWhere((element) => element.id == task.id);
    todoList[index].isCompleted = false;
    todoList.refresh();
    refreshCache();
  }

  refreshCache() async {
    Box box = await Hive.openBox("todo_db");
    box.put("list", todoList.toList());
  }

  deleteTask() {
    Get.defaultDialog(
        title: 'Delete Task',
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        content: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Text(
              'Are you sure to delete this task?',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      // todo: delete task
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
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
  }

  editTask() {
    Get.defaultDialog(
        title: 'Edit Task',
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        content: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            TextField(
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                      // todo: edit task
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
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Container(
                      padding: EdgeInsets.all(12),
                      child: Center(
                        child: Text(
                          'Cancel',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));
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
