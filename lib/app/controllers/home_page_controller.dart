import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/pages/home_page/model/product_model.dart';
import '../services/services.dart';
import '../ui/pages/product_detail/model/product_detail_model.dart';

class HomePageController extends GetxController {
  ProductListModel productListModel = ProductListModel();

  @override
  void onInit() {
    getAllProducts();
    super.onInit();
  }

  getAllProducts() async {
    albums = await Services().getAllProducts();
    update();
  }

  ProductDetailModel productDetailModel = ProductDetailModel();

  getProductDetail(int? productId) async {
    productDetailModel = await Services().getProductDetail(productId);
    update();
  }

  List<ProductListModel>? albums = [];
}
