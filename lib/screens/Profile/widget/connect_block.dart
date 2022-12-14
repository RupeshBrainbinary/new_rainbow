import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rainbow_new/common/Widget/text_styles.dart';
import 'package:rainbow_new/screens/Home/settings/connections/connections_profile/connections_profile_controller.dart';
import 'package:rainbow_new/utils/asset_res.dart';
import 'package:rainbow_new/utils/color_res.dart';
import 'package:rainbow_new/utils/strings.dart';

Widget connectAndBlock({
  String? title,
  String? subTitle,
  String? id,
  String? connect,
  String? block,
}) {
  // ConnectionsProfileController? controller =
  //     Get.put(ConnectionsProfileController());

  // HomeController homeController = Get.find();
  // ProfileController profileController = Get.find();
  // ConnectionsController connectionsController =  Get.put(ConnectionsController());
  return GetBuilder<ConnectionsProfileController>(
    id: "connections",
    builder: (controller) {
      return Column(
        children: [
          Text(
            title ?? "Amber J Santiago",
            style: gilroySemiBoldTextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 5,
          ),
          subTitle == null
              ? const SizedBox()
              : Text(
                  subTitle.toString(),
                  style: gilroyRegularTextStyle(fontSize: 14),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              connect == "no"
                  ? InkWell(
                      onTap: () {
                        controller.sendFriendRequestDetails(id!);
                        controller.update(["connections"]);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            margin: const EdgeInsets.all(9),
                            child: Image.asset(
                              AssetRes.profilep,
                              color: ColorRes.colorFFB2B2,
                            ),
                          ),
                          Text(
                            "Connect",
                            style: beVietnamSemiBoldTextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  : connect == "sent"
                      ? InkWell(
                          onTap: () {
                            controller.cancelFriendRequestDetails(id!);
                            controller.update(["connections"]);
                          },
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                width: 22,
                                margin: const EdgeInsets.all(9),
                                child: Image.asset(
                                  AssetRes.profilep,
                                  color: ColorRes.colorFFB2B2,
                                ),
                              ),
                              Text(
                                "Cancel Request",
                                style: beVietnamSemiBoldTextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        )
                      : connect == "yes"
                          ? InkWell(
                              onTap: () {
                                controller.unFriendRequestDetails(id!);
                                controller.update(["connections"]);
                              },
                              child: Row(
                                children: [
                                  Container(
                                    height: 22,
                                    width: 22,
                                    margin: const EdgeInsets.all(9),
                                    child: Image.asset(
                                      AssetRes.profilep,
                                      color: ColorRes.colorFFB2B2,
                                    ),
                                  ),
                                  Text(
                                    Strings.unFriend,
                                    style: beVietnamSemiBoldTextStyle(
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            )
                          : connect == "accept"
                              ? InkWell(
                                  onTap: () {
                                    controller.acceptFriendRequestDetails(id!);
                                    controller.update(["connections"]);
                                    // connectionsController.onAddBtnTap(id!, false);
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        margin: const EdgeInsets.all(9),
                                        child: Image.asset(
                                          AssetRes.profilep,
                                          color: ColorRes.colorFFB2B2,
                                        ),
                                      ),
                                      Text(
                                        "Accept",
                                        style: beVietnamSemiBoldTextStyle(
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                )
                              : InkWell(
                                  onTap: () {
                                    controller.cancelFriendRequestDetails(id!);
                                    controller.update(["connections"]);
                                  },
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 22,
                                        width: 22,
                                        margin: const EdgeInsets.all(9),
                                        child: Image.asset(
                                          AssetRes.profilep,
                                          color: ColorRes.colorFFB2B2,
                                        ),
                                      ),
                                      Text(
                                        Strings.cancel,
                                        style: beVietnamSemiBoldTextStyle(
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
              /*  InkWell(
                onTap: () {
                  controller.sendFriendRequestDetails(id!);
                },
                child: Row(
                  children: [
                    Container(
                      height: 22,
                      width: 22,
                      margin: const EdgeInsets.all(9),
                      child: Image.asset(
                        AssetRes.profilep,
                        color: ColorRes.colorFFB2B2,
                      ),
                    ),
                    Text(
                      "Accept",
                      style: beVietnamSemiBoldTextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )*/
              const SizedBox(
                width: 8,
              ),
              block == "no"
                  ? InkWell(
                      onTap: () {

                        controller.blockUserDetails(id);
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            margin: const EdgeInsets.all(9),
                            child: Image.asset(
                              AssetRes.block,
                              color: ColorRes.colorF82222.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            "Block",
                            style: beVietnamSemiBoldTextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        controller.unBlockUserDetails(id.toString());
                      },
                      child: Row(
                        children: [
                          Container(
                            height: 22,
                            width: 22,
                            margin: const EdgeInsets.all(9),
                            child: Image.asset(
                              AssetRes.block,
                              color: ColorRes.colorF82222.withOpacity(0.7),
                            ),
                          ),
                          Text(
                            "UnBlock",
                            style: beVietnamSemiBoldTextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ],
      );
    },
  );
}
