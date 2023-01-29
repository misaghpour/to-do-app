import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list_app/routes/app_pages.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), _goToNextScreen);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 20,
                ),
                Image.asset(
                  "assets/images/welcome_logo.png",
                  width: Get.width / 4,
                ),
              ],
            ),
            Text(
              'To do app',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              'This is a sample description for app',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            Spacer(),
            Text(
              'v 1.0.0',
              style: TextStyle(color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }

  _goToNextScreen() {
    Get.offAndToNamed(Routes.HOME);
  }
}
