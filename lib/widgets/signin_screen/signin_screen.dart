import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:signup/configs/app_colors.dart';
import 'package:signup/services/i_auth_service.dart';
import 'package:signup/widgets/common/custom_text_field.dart';
import 'package:signup/widgets/common/error_dialog.dart';
import 'package:signup/widgets/common/modal_progress_indicator.dart';
import 'package:signup/widgets/home_screen/home_screen.dart';
import 'package:signup/widgets/signin_screen/signin_screen_background.dart';
import 'package:signup/widgets/signin_screen/signin_screen_store.dart';
import 'package:signup/widgets/signup_screen/signup_screen.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  SigninScreenStore store;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      store = SigninScreenStore(Provider.of<IAuthService>(context));
      isInitialized = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninScreenBackground(
        child: SafeArea(
          child: LayoutBuilder(
            builder: (_, constraint) => SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Spacer(flex: 1),
                      Expanded(
                        flex: 4,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40),
                          child: Text(
                            'Welcome\nBack',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Observer(
                                builder: (_) => CustomTextField.dark(
                                  onChanged: (value) => store.email = value,
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  errorText: store.emailError,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 40),
                              child: Observer(
                                builder: (_) => CustomTextField.dark(
                                  onChanged: (value) => store.password = value,
                                  labelText: 'Password',
                                  hintText: 'Password',
                                  errorText: store.passwordError,
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 40.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Sign In',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Spacer(),
                              Observer(
                                builder: (_) => RawMaterialButton(
                                  onPressed: store.canSignIn
                                      ? () async {
                                          // resign keyboard
                                          FocusScope.of(context).unfocus();

                                          // display modal overlay progress indicator
                                          ModalProgressIndicator.show(context);

                                          final success = await store.signin();

                                          // remove modal overlay progress indicator
                                          ModalProgressIndicator.dismiss();

                                          if (success) {
                                            // route to next page
                                            Navigator.of(context).pushReplacement(
                                              MaterialPageRoute(
                                                builder: (_) => HomeScreen(),
                                              ),
                                            );
                                          } else {
                                            //show error
                                            showDialog(
                                              context: context,
                                              builder: (_) => ErrorDialog(),
                                            );
                                          }
                                        }
                                      : null,
                                  child: Icon(
                                    Icons.arrow_forward,
                                    color: AppColors.white,
                                    size: 35.0,
                                  ),
                                  shape: CircleBorder(),
                                  elevation: 2.0,
                                  fillColor: store.canSignIn ? AppColors.purple : AppColors.purple.withAlpha(156),
                                  padding: const EdgeInsets.all(8.0),
                                  constraints: BoxConstraints(
                                    minHeight: 75,
                                    minWidth: 75,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      FlatButton(
                        // padding: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => SignupScreen(),
                          ),
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
