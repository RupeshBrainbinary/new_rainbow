import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:rainbow_new/model/user_model.dart';
import 'package:rainbow_new/service/pref_services.dart';
import 'package:rainbow_new/utils/pref_keys.dart';

class AuthService {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<Object> loginUser(
      {required UserModel userModel,
      required String email,
      required String pwd}) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pwd);

      if (userCredential.user != null) {
        //await PrefService.setValue(PrefKeys.isLogin, true);
        await PrefService.setValue(PrefKeys.uid, userCredential.user!.uid);
        return userCredential.user!.uid;
      }
      return false;
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      return false;
    }
  }
}
