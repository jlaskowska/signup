import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:signup/services/i_auth_service.dart';

class FirebaseAuthService implements IAuthService {
  @override
  Future<bool> createUserAccount({@required String email, @required String password}) async {
    try {
      final result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      if (result != null) {
        return true;
      }
    } catch (error) {
      print(error);
    }

    return false;
  }

  @override
  Future<bool> login({@required String email, @required String password}) async {
    try {
      final result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if (result != null) {
        return true;
      }
    } catch (error) {
      print(error);
    }

    return false;
  }

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (error) {
      print(error);
    }
  }
}
