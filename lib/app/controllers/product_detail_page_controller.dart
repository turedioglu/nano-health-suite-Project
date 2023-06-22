import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/pages/product_detail/model/product_detail_model.dart';

import '../services/services.dart';

class ProductDetailPageController extends GetxController {
  ProductDetailModel productDetailModel = ProductDetailModel();

  getProductDetail(int? productId) async {
    productDetailModel = await Services().getProductDetail(productId);
  }
}
