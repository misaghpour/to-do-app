import 'package:flutter/material.dart';
import 'package:to_do_list_app/controllers/home_controller.dart';

AppBar buildMyAppBar(HomeController controller) {
    return AppBar(
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
    );
  }