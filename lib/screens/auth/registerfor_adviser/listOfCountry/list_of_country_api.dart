import 'dart:convert';


import 'package:http/http.dart' as http;

import 'package:rainbow_new/screens/auth/registerfor_adviser/listOfCountry/list_of_country_json.dart';
import 'package:rainbow_new/service/http_services.dart';
import 'package:rainbow_new/service/pref_services.dart';
import 'package:rainbow_new/utils/end_points.dart';
import 'package:rainbow_new/utils/pref_keys.dart';

class ListOfCountryApi {
  static Future postRegister() async {
    try {
      String url = EndPoints.countryList;
      String token = PrefService.getString(PrefKeys.registerToken);
      http.Response? response = await HttpService.getApi(url: url, header: {
        "Content-Type": "application/json",
        "x-access-token": token
      });
      if (response != null && response.statusCode == 200) {
        return listCountryModelFromJson(response.body);
      }
       jsonDecode(response!.body)["message"];
      /*  message == "Failed! Email is already in use!"
          ? errorToast(message)
          : */
      /*  flutterToast(message);*/
    } catch (e) {

      return listCountryModelFromJson("");
    }
  }
}
