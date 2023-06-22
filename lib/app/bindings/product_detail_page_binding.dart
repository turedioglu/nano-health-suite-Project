import 'package:get/get.dart';
import '../controllers/product_detail_page_controller.dart';


class ProductDetailPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductDetailPageController>(() => ProductDetailPageController());
  }
}