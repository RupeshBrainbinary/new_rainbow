import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rainbow_new/common/popup.dart';
import 'package:rainbow_new/screens/advertisement/ad_home/screen/payment_failed.dart/payment_failed_screen.dart';
import 'package:rainbow_new/service/http_services.dart';
import 'package:rainbow_new/service/pref_services.dart';
import 'package:rainbow_new/utils/end_points.dart';
import 'package:rainbow_new/utils/pref_keys.dart';

import '../ad_home/screen/payment_successful/payment_successful_screen.dart';

class BoostAdvertisementApi {
  static Future boostAdvertisement({
    List? tagUser,
    String? title,
    List? idItem,
    String? startDate,
    String? endDate,
    String? amount,
    String? currency,
  }) async {
    String accesToken = PrefService.getString(PrefKeys.registerToken);
    int userId = PrefService.getInt(PrefKeys.userId);
    try {
      String url = EndPoints.boostAdvertisement;
      Map<String, dynamic> param = {
        "id_advertisement": userId,
        "start_date": startDate,
        "end_date": endDate,
        "amount": amount,
        "currency": currency
      };

      http.Response? response = await HttpService.postApi(
          url: url,
          body: jsonEncode(param),
          header: {
            "Content-Type": "application/json",
            "x-access-token": accesToken
          });

      if (response != null && response.statusCode == 200) {
        bool? status = jsonDecode(response.body)["status"];

        if (status == false) {
          Get.to(() => PaymentFailedScreen());
          errorToast(jsonDecode(response.body)["message"]);
        } else if (status == true) {
          Get.to(() => PaymentSuccessfulScreen());
          flutterToast(jsonDecode(response.body)["message"]);
        }
      } else {

      }
    } catch (e) {

      return [];
    }
  }
}
