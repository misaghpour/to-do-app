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
            Text('To do app'),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _goToNextScreen() {
    Get.offAndToNamed(Routes.HOME);
  }
}
