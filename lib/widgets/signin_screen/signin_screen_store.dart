import 'package:mobx/mobx.dart';
import 'package:signup/configs/validators.dart';
import 'package:signup/services/i_auth_service.dart';

part 'signin_screen_store.g.dart';

class SigninScreenStore = _SigninScreenStore with _$SigninScreenStore;

abstract class _SigninScreenStore with Store {
  final IAuthService _authService;
  List<ReactionDisposer> _disposers;

  _SigninScreenStore(this._authService) {
    _disposers = [
      reaction((_) => email, _validateEmail),
      reaction((_) => password, _validatePassword),
    ];
  }

  void dispose() => _disposers.forEach((disposer) => disposer());

  @observable
  String email = '';

  @observable
  String password = '';

  @observable
  String emailError;

  @observable
  String passwordError;

  @computed
  bool get canSignIn => email == '' || password == '' ? false : emailError == null && passwordError == null;

  Future<bool> signin() async => _authService.login(email: email, password: password);

  @action
  void _validateEmail(String value) => emailError = Validators.email.hasMatch(value) ? null : 'Not a valid email';

  @action
  void _validatePassword(String value) => passwordError = value.length >= 6 ? null : 'At least 6 characters';
}
