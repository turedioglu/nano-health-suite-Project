import 'package:flutter/material.dart';
import 'package:nano_health_suite_app/app/ui/pages/home_page/model/product_model.dart';
import 'package:nano_health_suite_app/app/ui/pages/login_page/model/login_model.dart';
import 'package:nano_health_suite_app/app/ui/pages/product_detail/model/product_detail_model.dart';
import '../../core/init/network/network_manager.dart';

class Services {
  BuildContext? context;
  Services({this.context});

  Future<LoginModel> login({String? username, String? password}) async {
    return await NetworkManager.instance.post<LoginModel>(
      path: "/auth/login",
      model: LoginModel(),
      data: {
        "username": username,
        "password": password,
      },
      context: context,
    );
  }

  Future<List<ProductListModel>> getAllProducts() async {
    return await NetworkManager.instance.get<ProductListModel>(
      path: "/products",
      model: ProductListModel(),
      context: context,
    );
  }

  Future<ProductDetailModel> getProductDetail(int? productId) async {
    return await NetworkManager.instance.get<ProductDetailModel>(
      path: "/products/$productId",
      model: ProductDetailModel(),
      context: context,
    );
  }
}
