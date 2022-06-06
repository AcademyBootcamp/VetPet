import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:online_vet_flutter/model/constants.dart';
import 'package:online_vet_flutter/utils/dialog_utils.dart';
import 'package:online_vet_flutter/utils/transaction_route.dart';
import 'package:online_vet_flutter/widget/login/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      title: 'Online Vet',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
              headline: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: Colors.white),
              subhead: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: DialogUtils.getColor("96A7AF")),
              display1: TextStyle(
                  color: DialogUtils.getColor("ffffff"),
                  fontSize: 13,
                  fontStyle: FontStyle.normal,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w500)),
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          })),
      onGenerateRoute: (RouteSettings settings) {
        // print(settings);
        switch (settings.name) {
          case login:
            //return FadeTransitionRoute(widget: LoginScreen());
            return PageTransition(
                child: LoginScreen(settings.arguments),
                type: PageTransitionType.leftToRight,
                settings: settings);
//            break;
//          case register:
//            return PageTransition(
//                child: SignUpPage(settings.arguments),
//                type: PageTransitionType.leftToRight,
//                settings: settings);
//            break;
//          case otp:
//            return PageTransition(
//                child: OtpPage(settings.arguments),
//                type: PageTransitionType.leftToRight,
//                settings: settings);
//            break;
//          case home:
//            return PageTransition(
//                child: HomePage(),
//                type: PageTransitionType.leftToRight,
//                settings: settings);
//            break;
//          case forgotpassword:
//            return PageTransition(
//                child: ForgotPassword(),
//                type: PageTransitionType.leftToRight,
//                settings: settings);

          default:
            return null;
        }
      },
    );
  }
}
