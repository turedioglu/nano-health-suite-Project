
import 'package:get/get.dart';
import '../controllers/login_page_controller.dart';


class LoginPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(() => LoginPageController());
  }
}