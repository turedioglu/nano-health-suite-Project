import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/pages/product_detail/product_detail_page.dart';
import 'package:nano_health_suite_app/core/base/model/base_state.dart';
import 'package:nano_health_suite_app/core/init/theme/color_manager.dart';
import 'package:rate/rate.dart';
import '../../../controllers/home_page_controller.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Utility.dynamicWidthPixel(57)),
        child: AppBar(
          centerTitle: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
          ),
          title: Text(
            'All Products',
            style: TextStyle(
              color: ColorManager.instance.thirdDark,
              fontWeight: FontWeight.w700,
              fontSize: Utility.dynamicTextSize(28),
            ),
          ),
        ),
      ),
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (c) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: c.productDetailList?.length ?? 0,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(Utility.dynamicWidthPixel(26)),
                child: InkWell(
                  onTap: () async {
                    await c.getProductDetail(c.productDetailList?[index].id);
                    if (c.productDetailModel.id != null) {
                      Get.to(() => const ProductDetailPage());
                    }
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: Utility.dynamicWidthPixel(160),
                          width: Get.width,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.instance.thirdDark),
                            image: DecorationImage(
                              image: CachedNetworkImageProvider(
                                c.productDetailList?[index].image ?? "",
                              ),
                            ),
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Rate(
                                  iconSize: Utility.dynamicWidthPixel(18),
                                  color: ColorManager.instance.yellow,
                                  allowHalf: true,
                                  initialValue: c.productDetailList?[index].rating?.rate?.toDouble() ?? 0.0,
                                  readOnly: false,
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(10)),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                c.productDetailList?[index].title ?? "",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: ColorManager.instance.thirdDark,
                                  fontSize: Utility.dynamicTextSize(14),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(16)),
                                child: Text(
                                  c.productDetailList?[index].description ?? "",
                                  style: TextStyle(color: ColorManager.instance.thirdDark, fontWeight: FontWeight.w400, fontSize: Utility.dynamicTextSize(15)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
