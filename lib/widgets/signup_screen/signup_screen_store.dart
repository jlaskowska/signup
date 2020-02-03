import 'package:mobx/mobx.dart';
import 'package:signup/configs/validators.dart';
import 'package:signup/services/i_auth_service.dart';

part 'signup_screen_store.g.dart';

class SignupScreenStore = _SignupScreenStore with _$SignupScreenStore;

abstract class _SignupScreenStore with Store {
  final IAuthService _authService;
  List<ReactionDisposer> _disposers;

  _SignupScreenStore(this._authService) {
    _disposers = [
      reaction((_) => email, _validateEmail),
      reaction((_) => password, _validatePassword),
    ];
  }

  void dispose() => _disposers.forEach((d) => d());

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String emailError;

  @observable
  String passwordError;

  @computed
  bool get canSubmit {
    //=> email == '' || password == '' ? false : emailError == null && passwordError == null;

    print('---');
    print('email: $email');
    print('password: $password');
    print('emailError: $emailError');
    print('passwordError: $passwordError');

    return email == '' || password == '' ? false : emailError == null && passwordError == null;
  }

  Future<bool> signup() async => _authService.createUserAccount(email: email, password: password);

  @action
  void _validateEmail(String value) => emailError = Validators.email.hasMatch(value) ? null : 'Not a valid email';

  @action
  void _validatePassword(String value) => passwordError = value.length >= 6 ? null : 'At least 6 characters';
}
