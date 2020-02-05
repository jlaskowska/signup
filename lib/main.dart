import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:signup/services/firebase_auth_service.dart';
import 'package:signup/services/i_auth_service.dart';
import 'package:signup/widgets/signin_screen/signin_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<IAuthService>(
          create: (_) => FirebaseAuthService(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(fontFamily: GoogleFonts.rubik().fontFamily),
        debugShowCheckedModeBanner: false,
        home: SigninScreen(),
      ),
    );
  }
}
