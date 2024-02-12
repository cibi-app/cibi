import 'package:cibi/src/cibi/presentation/screens/error_screen.dart';
import 'package:cibi/src/cibi/presentation/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case HomeScreen.routeName:
      return PageTransition(
        child: HomeScreen(),
        type: PageTransitionType.rightToLeft,
        settings: settings,
      );
    default:
      return PageTransition(
        child: Scaffold(
          body: ErrorScreen(error: "Something went wrong"),
        ),
        type: PageTransitionType.rightToLeft,
        settings: settings,
      );
  }
}
