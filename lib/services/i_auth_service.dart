import 'package:flutter/foundation.dart';

abstract class IAuthService {
  Future<bool> createUserAccount({@required String email, @required String password});

  Future<bool> login({@required String email, @required String password});

  Future<void> logout();
}
