import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:signup/services/i_auth_service.dart';
import 'package:signup/widgets/common/custom_text_field.dart';
import 'package:signup/widgets/common/error_dialog.dart';
import 'package:signup/widgets/common/modal_progress_indicator.dart';
import 'package:signup/widgets/signup_screen/signup_screen_store.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  SignupScreenStore store;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      store = SignupScreenStore(Provider.of<IAuthService>(context));
      isInitialized = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                Observer(
                  builder: (_) => CustomTextField.dark(
                    onChanged: (value) => store.email = value,
                    labelText: 'Email',
                    hintText: 'Email',
                    errorText: store.emailError,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                Observer(
                  builder: (_) => CustomTextField.dark(
                    onChanged: (value) => store.password = value,
                    labelText: 'Password',
                    hintText: 'Password',
                    errorText: store.passwordError,
                    shouldObscureText: true,
                  ),
                ),
                Observer(
                  builder: (_) => RaisedButton(
                    child: const Text('Sign up'),
                    onPressed: store.canSubmit
                        ? () async {
                            // resign keyboard
                            FocusScope.of(context).unfocus();

                            // display modal overlay progress indicator
                            ModalProgressIndicator.show(context);

                            final success = await store.signup();

                            // remove modal overlay progress indicator
                            ModalProgressIndicator.dismiss();

                            if (success) {
                              // route to next page
                            } else {
                              //show error
                              showDialog(
                                context: context,
                                builder: (_) => ErrorDialog(),
                              );
                            }
                          }
                        : null,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
