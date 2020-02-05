import 'package:mobx/mobx.dart';
import 'package:signup/services/i_auth_service.dart';

part 'home_screen_store.g.dart';

class HomeScreenStore = _HomeScreenStore with _$HomeScreenStore;

abstract class _HomeScreenStore with Store {
  final IAuthService _authService;

  _HomeScreenStore(this._authService);

  Future<void> signout() async => await _authService.logout();
}
