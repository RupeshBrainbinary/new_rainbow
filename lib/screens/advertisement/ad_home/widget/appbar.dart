import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:rainbow_new/common/Widget/text_styles.dart';
import 'package:rainbow_new/common/popup.dart';
import 'package:rainbow_new/screens/Home/settings/payment/payment_controller.dart';
import 'package:rainbow_new/screens/advertisement/ad_dashboard/advertisement_controlle.dart';
import 'package:rainbow_new/screens/advertisement/ad_home/ad_home_controller.dart';
import 'package:rainbow_new/screens/advertisement/ad_home/screen/create_advertisement/create_advertisement_screen.dart';
import 'package:rainbow_new/utils/asset_res.dart';
import 'package:rainbow_new/utils/color_res.dart';
import 'package:rainbow_new/utils/strings.dart';

import '../screen/create_advertisement/create_advertisement_controller.dart';

Widget appbar({context}) {
  AdvertisementController advertisementController =
      Get.put(AdvertisementController());
  CreateAdvertisementController advertisementControllers =
      Get.put(CreateAdvertisementController());

  return GetBuilder<AdHomeController>(
      id: "update",
      builder: (controller) {
        return SizedBox(
          width: Get.width,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                children :[
                InkWell(
                  onTap: () {
                    advertisementController.key.currentState?.openDrawer();
                    controller.update(["update"]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 9),
                    child: controller.viewAdvertiserModel.data == null
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              AssetRes.portraitPlaceholder,
                              height: 34,
                              width: 34,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: controller
                                    .viewAdvertiserModel.data!.profileImage
                                    .toString()
                                    .isEmpty
                                ? Image.asset(
                                    AssetRes.portraitPlaceholder,
                                    height: 34,
                                    width: 34,
                                  )
                                : CachedNetworkImage(
                                    imageUrl: controller
                                        .viewAdvertiserModel.data!.profileImage
                                        .toString(),
                                    placeholder: ((context, url) => Image.asset(
                                        AssetRes.portraitPlaceholder)),
                                    errorWidget: ((context, url, error) =>
                                        Image.asset(
                                            AssetRes.portraitPlaceholder)),
                                    fit: BoxFit.cover,
                                    height: 34,
                                    width: 34,
                                  ),
                            /*FadeInImage(
                      placeholder: const AssetImage(
                          AssetRes.portraitPlaceholder),
                      image: NetworkImage(controller
                          .viewAdvertiserModel.data!.profileImage
                          .toString()),
                      fit: BoxFit.cover,
                      height: 34,
                      width: 34,
                    )*/
                          ),
                  ),
                  /*   Container(
              height: 34,
              width: 34,
              margin: const EdgeInsets.only(right: 9),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    AssetRes.advertiserImage,
                  ),
                ),
              ),
            ),*/
                ),
                Image.asset(
                  AssetRes.handIcon,
                  height: 34,
                  width: 34,
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Good ${controller.timeOfDay.toString()},",
                      overflow: TextOverflow.clip,
                      maxLines: 2,
                      style: gilroySemiBoldTextStyle(fontSize: 12),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    /* Text(
                  "Hello ${controller.viewAdvertiserModel.data?.fullName ?? ""}",
                  style: gilroyBoldTextStyle(fontSize: 20),
                ),*/
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              "Hello ${controller.viewAdvertiserModel.data?.fullName ?? ""}",
                              style: gilroySemiBoldTextStyle(
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GetBuilder<AdHomeController>(
                    id: "network",
                    builder: (controller){
                      controller.checkUserConnection();
                      return  InkWell(
                        onTap: controller.activeConnection == false
                            ? (){
                          errorToast("No internet connection");
                        }
                            :() async {
                          advertisementControllers.tagsController.clear();
                          advertisementControllers.titleController.clear();
                          advertisementControllers.countryController.clear();
                          advertisementControllers.streetController.clear();
                          advertisementControllers.cityController.clear();
                          advertisementControllers.provinceController.clear();
                          advertisementControllers.postalCodeController.clear();
                          advertisementControllers.dateController.clear();
                          advertisementControllers.descriptoionController.clear();
                          advertisementControllers.urlLinkController.clear();
                          advertisementControllers.callToActionController.clear();
                          advertisementControllers.callToAction = null;
                          advertisementControllers.address =
                              Strings.useCurrentLocation;
                          advertisementControllers.countryController.clear();
                          advertisementControllers.selectedCity = null;
                          advertisementControllers.imagePath = [];

                          PaymentController paymentController =
                          Get.put(PaymentController());


                          await paymentController.listCardApi(showToast: false);



                          paymentController.listCardModel.data?.length == null
                              ? controller.onTap()
                              : Get.to(() => CreateAdvertisementScreen());
                          controller.update(["update"]);
                        },
                        child: Container(
                          height: 34,
                          width: 34,
                          margin: const EdgeInsets.only(bottom: 12),
                          decoration: const BoxDecoration(
                            color: ColorRes.color_9297FF,
                            shape: BoxShape.circle,
                          ),
                          child:
                          const Icon(Icons.add, size: 15, color: ColorRes.white),
                        ),
                      );
                    }),
               /*Padding(
                 padding: EdgeInsets.only(top: 50),
                 child:  GetBuilder<AdHomeController>(
                     id: "network",
                     builder: (controller){
                       controller.checkUserConnection();
                       return  InkWell(
                         onTap: controller.activeConnection == false
                             ? (){
                           errorToast("No internet connection");
                         }
                             :() async {
                           advertisementControllers.tagsController.clear();
                           advertisementControllers.titleController.clear();
                           advertisementControllers.countryController.clear();
                           advertisementControllers.streetController.clear();
                           advertisementControllers.cityController.clear();
                           advertisementControllers.provinceController.clear();
                           advertisementControllers.postalCodeController.clear();
                           advertisementControllers.dateController.clear();
                           advertisementControllers.descriptoionController.clear();
                           advertisementControllers.urlLinkController.clear();
                           advertisementControllers.callToActionController.clear();
                           advertisementControllers.callToAction = null;
                           advertisementControllers.address =
                               Strings.useCurrentLocation;
                           advertisementControllers.countryController.clear();
                           advertisementControllers.selectedCity = null;
                           advertisementControllers.imagePath = [];

                           PaymentController paymentController =
                           Get.put(PaymentController());


                           await paymentController.listCardApi(showToast: false);



                           paymentController.listCardModel.data?.length == null
                               ? controller.onTap()
                               : Get.to(() => CreateAdvertisementScreen());
                           controller.update(["update"]);
                         },
                         child: Container(
                           height: 34,
                           width: 34,
                           margin: const EdgeInsets.only(bottom: 12),
                           decoration: const BoxDecoration(
                             color: ColorRes.color_9297FF,
                             shape: BoxShape.circle,
                           ),
                           child:
                           const Icon(Icons.add, size: 15, color: ColorRes.white),
                         ),
                       );
                     }),
               ),*/
              ],
            ),
          ),
        );
      });
}
