import 'package:flutter/material.dart';
import 'package:signup/configs/app_colors.dart';
import 'package:signup/widgets/common/custom_text_field.dart';
import 'package:signup/widgets/signin_screen/signin_screen_background.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SigninScreenBackground(
        child: SafeArea(
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Spacer(flex: 1),
                Expanded(
                  flex: 3,
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
                  flex: 3,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: CustomTextField.dark(
                          onChanged: null,
                          labelText: 'Email',
                          hintText: 'Email',
                          errorText: null,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: CustomTextField.dark(
                          onChanged: null,
                          labelText: 'Password',
                          hintText: 'Password',
                          errorText: null,
                          keyboardType: TextInputType.emailAddress,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          color: AppColors.white,
                          size: 35.0,
                        ),
                        shape: CircleBorder(),
                        elevation: 2.0,
                        fillColor: AppColors.purple,
                        padding: const EdgeInsets.all(8.0),
                        constraints: BoxConstraints(
                          minHeight: 75,
                          minWidth: 75,
                        ),
                      ),
                    ],
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
