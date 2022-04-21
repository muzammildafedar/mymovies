import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovies/ui/views/auth.dart';
import 'package:mymovies/ui/views/home.dart';
// import 'package:mymovies/ui/views/profile_setup.dart';
import 'package:mymovies/ui/views/started.dart';
import 'package:mymovies/utils/constant/routename.dart';

dynamic animateRoute(Widget routeName) {
  return Platform.isIOS
      ? MaterialPageRoute(builder: (_) => routeName)
      : PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => routeName,
          transitionDuration: Duration(milliseconds: 600),
          reverseTransitionDuration: Duration(milliseconds: 600),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(0.0, 1.0);
            var end = Offset.zero;
            var curve = Curves.ease;
            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutePaths.Splash:
        return animateRoute(GettingStarted());

      case RoutePaths.Auth:
        return animateRoute(AuthToStart());
      // case RoutePaths.ProfileSetup:
      //   return animateRoute(ProfileSetup());
      case RoutePaths.Home:
        return animateRoute(HomeView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
