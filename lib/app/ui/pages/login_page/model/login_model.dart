import 'package:nano_health_suite_app/core/base/model/base_model.dart';

class LoginModel extends IBaseModel {
  String? token;

  LoginModel({this.token});

  LoginModel.fromJson(Map<dynamic, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }

  @override
  fromJson(Map json) {
    return LoginModel.fromJson(json);
  }
}
