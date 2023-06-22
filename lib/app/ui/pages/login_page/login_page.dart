import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/global_widgets/n_button.dart';
import 'package:nano_health_suite_app/app/ui/global_widgets/n_textform_field.dart';
import 'package:nano_health_suite_app/app/ui/pages/home_page/home_page.dart';
import 'package:nano_health_suite_app/core/base/model/base_state.dart';
import '../../../../core/init/theme/color_manager.dart';
import '../../../controllers/login_page_controller.dart';
import '../utils/validator_manager.dart';

class LoginPage extends GetView<LoginPageController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LoginPageController>(
        init: LoginPageController(),
        builder: (c) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: Get.height * 0.45,
                      width: Get.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            ColorManager.instance.secondary,
                            ColorManager.instance.primary,
                          ],
                          stops: const [
                            0,
                            1,
                          ],
                        ),
                      ),
                      child: Center(
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: Utility.dynamicWidthPixel(30), left: Utility.dynamicWidthPixel(36)),
                      child: Text("Log In",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: Utility.dynamicTextSize(34),
                            color: ColorManager.instance.white,
                          )),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(Utility.dynamicWidthPixel(36)),
                  child: Column(
                    children: [
                      NTextFormField.instance.widget(
                        context: context,
                        controller: c.usernameController,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Utility.dynamicTextSize(14),
                          color: ColorManager.instance.thirdDark,
                        ),
                        validateMode: AutovalidateMode.onUserInteraction,
                        suffixIcon: Icon(
                          Icons.check_circle_outline,
                          size: Utility.dynamicWidthPixel(17),
                          color: ColorManager.instance.primary,
                        ),
                        validation: ValidatorManager.defaultEmptyCheckValidator,
                      ),
                      NTextFormField.instance.widget(
                        context: context,
                        controller: c.passwordController,
                        labelText: 'Password',
                        obscureText: true,
                        labelStyle: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: Utility.dynamicTextSize(14),
                          color: ColorManager.instance.thirdDark,
                        ),
                        validateMode: AutovalidateMode.onUserInteraction,
                        validation: ValidatorManager.defaultEmptyCheckValidator,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(24), bottom: Utility.dynamicWidthPixel(43)),
                        child: NButton(
                          color: ColorManager.instance.primary,
                          style: TextStyle(fontWeight: FontWeight.w700, color: ColorManager.instance.white, fontSize: Utility.dynamicTextSize(17)),
                          onTap: () async{
                           await c.login(username: c.usernameController.text, password: c.passwordController.text);
                            if (c.loginModel.token != null) {
                              Get.to(() => const HomePage());
                            }
                          },
                          borderRadius: 62,
                          textColor: ColorManager.instance.white,
                          title: "Continue",
                        ),
                      ),
                      Text(
                        "NEED HELP?",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: ColorManager.instance.thirdDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
