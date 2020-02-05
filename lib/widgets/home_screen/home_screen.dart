import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signup/configs/app_colors.dart';
import 'package:signup/services/i_auth_service.dart';
import 'package:signup/widgets/common/modal_progress_indicator.dart';
import 'package:signup/widgets/home_screen/home_screen_store.dart';
import 'package:signup/widgets/signin_screen/signin_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenStore store;
  bool isInitialized = false;

  @override
  void didChangeDependencies() {
    if (!isInitialized) {
      store = HomeScreenStore(Provider.of<IAuthService>(context));
      isInitialized = true;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.lightPink,
            AppColors.pink,
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Spacer(flex: 2),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      'Sign Out',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                    RawMaterialButton(
                      onPressed: () async {
                        // display modal overlay progress indicator
                        ModalProgressIndicator.show(context);

                        await store.signout();

                        // // remove modal overlay progress indicator
                        ModalProgressIndicator.dismiss();

                        // route to next page
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (_) => SigninScreen(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_back,
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
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
