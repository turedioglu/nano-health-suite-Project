import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nano_health_suite_app/app/ui/global_widgets/n_button.dart';
import 'package:nano_health_suite_app/core/base/model/base_state.dart';
import 'package:nano_health_suite_app/core/init/theme/color_manager.dart';
import 'package:rate/rate.dart';
import '../../../controllers/home_page_controller.dart';

class ProductDetailPage extends GetView<HomePageController> {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomePageController>(
        init: HomePageController(),
        builder: (c) {
          return Stack(
            alignment: Alignment.topLeft,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(30)),
                    child: CachedNetworkImage(
                      imageUrl: c.productDetailModel.image ?? "",
                      width: Get.width,
                      height: Utility.dynamicWidthPixel(250),
                    ),
                  ),
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                      snap: true,
                      expand: false,
                      initialChildSize: 0.60,
                      minChildSize: 0.60,
                      maxChildSize: 0.90,
                      builder: (BuildContext context, ScrollController scrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: ColorManager.instance.white,
                            border: Border.all(color: ColorManager.instance.thirdDark),
                            borderRadius: const BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width: Utility.dynamicWidthPixel(48),
                                      height: Utility.dynamicWidthPixel(48),
                                      decoration: BoxDecoration(
                                        color: ColorManager.instance.white,
                                        border: Border.all(color: ColorManager.instance.thirdDark),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(
                                            10,
                                          ),
                                        ),
                                      ),
                                      child: Center(
                                          child: Icon(
                                        Icons.ios_share,
                                        size: 22,
                                        color: ColorManager.instance.thirdDark,
                                      )),
                                    ),
                                    Expanded(
                                        child: Padding(
                                      padding: EdgeInsets.only(
                                        left: Utility.dynamicWidthPixel(12),
                                      ),
                                      child: NButton(
                                        color: ColorManager.instance.primary,
                                        onTap: () {},
                                        title: "Order Now",
                                        borderRadius: 40,
                                        textColor: ColorManager.instance.white,
                                        style: TextStyle(color: ColorManager.instance.white, fontSize: Utility.dynamicTextSize(14), fontWeight: FontWeight.w700),
                                      ),
                                    )),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(18)),
                                  child: Text(
                                    "Description",
                                    style: TextStyle(color: ColorManager.instance.thirdDark, fontStyle: FontStyle.italic),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(18)),
                                  child: Text(c.productDetailModel.description ?? ""),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: Utility.dynamicWidthPixel(40)),
                                  child: Container(
                                    width: Get.width,
                                    decoration: BoxDecoration(color: ColorManager.instance.gray),
                                    child: Padding(
                                      padding: EdgeInsets.all(Utility.dynamicWidthPixel(16)),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Reviews " "(${c.productDetailModel.rating?.count})",
                                            style: TextStyle(
                                              color: ColorManager.instance.thirdDark,
                                              fontWeight: FontWeight.w600,
                                              fontSize: Utility.dynamicTextSize(15),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                c.productDetailModel.rating?.rate.toString() ?? "",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  color: ColorManager.instance.thirdDark,
                                                  fontSize: Utility.dynamicTextSize(32),
                                                ),
                                              ),
                                              Rate(
                                                iconSize: Utility.dynamicWidthPixel(45),
                                                color: ColorManager.instance.yellow,
                                                allowHalf: true,
                                                initialValue: c.productDetailModel.rating?.rate?.toDouble() ?? 0.0,
                                                readOnly: false,
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: Utility.dynamicWidthPixel(30),
                      left: Utility.dynamicWidthPixel(20),
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: Utility.dynamicWidthPixel(40),
                        height: Utility.dynamicWidthPixel(40),
                        decoration: BoxDecoration(
                          color: ColorManager.instance.white,
                          border: Border.all(color: ColorManager.instance.thirdDark),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(
                              10,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back,
                            size: 25,
                            color: ColorManager.instance.thirdDark,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Utility.dynamicWidthPixel(30),
                      right: Utility.dynamicWidthPixel(20),
                    ),
                    child: Container(
                      width: Utility.dynamicWidthPixel(40),
                      height: Utility.dynamicWidthPixel(40),
                      decoration: BoxDecoration(
                        color: ColorManager.instance.white,
                        border: Border.all(color: ColorManager.instance.thirdDark),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(
                            10,
                          ),
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          size: 25,
                          color: ColorManager.instance.thirdDark,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}
