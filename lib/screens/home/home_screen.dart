import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/controllers/home_controller.dart';

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
                color: Colors.grey,
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
                      child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        'Not Completed',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                    ),
                  )),
                  SizedBox(
                    width: 5,
                  ),
                  Expanded(
                      child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Center(
                      child: Text(
                        'Completed',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )),
                ]),
              ),
              SizedBox(
                height: 12,
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (String taskStr in controller.todoList)
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                  border: Border.all(
                                      color: Colors.blue, width: 1.5)),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 8),
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
                                        style: TextStyle(fontSize: 20),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.edit_outlined,
                                    color: Colors.blue,
                                    size: 32,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Colors.red,
                                    size: 32,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.blue,
              ),
              Container(
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
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
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
