import 'package:beauty_related/auth_screens/login.dart';
import 'package:beauty_related/auth_screens/privacy_policy.dart';
import 'package:beauty_related/auth_screens/select_role_screen.dart';
import 'package:beauty_related/auth_screens/terms_conditions.dart';
import 'package:beauty_related/bottom_screens/account_setting.dart';
import 'package:beauty_related/bottom_screens/bookings_screens.dart';
import 'package:beauty_related/bottom_screens/bottomnavigation_screen.dart';
import 'package:beauty_related/bottom_screens/edit_profile.dart';
import 'package:beauty_related/bottom_screens/liked_screens.dart';
import 'package:beauty_related/bottom_screens/notification_screen.dart';
import 'package:beauty_related/bottom_screens/profile_screen.dart';
import 'package:beauty_related/bottom_screens/reviews_screen.dart';
import 'package:beauty_related/bottom_screens/search_screen.dart';
import 'package:beauty_related/onboarding_screen.dart';
import 'package:beauty_related/portfolio_screen.dart';
import 'package:beauty_related/provider_bottom_screens/provider_home_screen.dart';
import 'package:beauty_related/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home:SplashScreen()
    );
  }
}


