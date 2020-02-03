// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_screen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignupScreenStore on _SignupScreenStore, Store {
  Computed<bool> _$canSubmitComputed;

  @override
  bool get canSubmit =>
      (_$canSubmitComputed ??= Computed<bool>(() => super.canSubmit)).value;

  final _$emailAtom = Atom(name: '_SignupScreenStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_SignupScreenStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$emailErrorAtom = Atom(name: '_SignupScreenStore.emailError');

  @override
  String get emailError {
    _$emailErrorAtom.context.enforceReadPolicy(_$emailErrorAtom);
    _$emailErrorAtom.reportObserved();
    return super.emailError;
  }

  @override
  set emailError(String value) {
    _$emailErrorAtom.context.conditionallyRunInAction(() {
      super.emailError = value;
      _$emailErrorAtom.reportChanged();
    }, _$emailErrorAtom, name: '${_$emailErrorAtom.name}_set');
  }

  final _$passwordErrorAtom = Atom(name: '_SignupScreenStore.passwordError');

  @override
  String get passwordError {
    _$passwordErrorAtom.context.enforceReadPolicy(_$passwordErrorAtom);
    _$passwordErrorAtom.reportObserved();
    return super.passwordError;
  }

  @override
  set passwordError(String value) {
    _$passwordErrorAtom.context.conditionallyRunInAction(() {
      super.passwordError = value;
      _$passwordErrorAtom.reportChanged();
    }, _$passwordErrorAtom, name: '${_$passwordErrorAtom.name}_set');
  }

  final _$_SignupScreenStoreActionController =
      ActionController(name: '_SignupScreenStore');

  @override
  void _validateEmail(String value) {
    final _$actionInfo = _$_SignupScreenStoreActionController.startAction();
    try {
      return super._validateEmail(value);
    } finally {
      _$_SignupScreenStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _validatePassword(String value) {
    final _$actionInfo = _$_SignupScreenStoreActionController.startAction();
    try {
      return super._validatePassword(value);
    } finally {
      _$_SignupScreenStoreActionController.endAction(_$actionInfo);
    }
  }
}
