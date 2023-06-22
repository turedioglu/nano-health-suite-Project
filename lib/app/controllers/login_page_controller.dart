import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/pages/login_page/model/login_model.dart';

import '../services/services.dart';

class LoginPageController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  LoginModel loginModel = LoginModel();

  login({required String? username, required String? password}) async {
    loginModel = await Services().login(
      username: username,
      password: password,
    );
  }
}
