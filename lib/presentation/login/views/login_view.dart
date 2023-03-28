import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:soc_grocery/app/config/app_text_styles.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'LoginView is working',
          style: AppTextStyles.title
        ),
      ),
    );
  }
}
