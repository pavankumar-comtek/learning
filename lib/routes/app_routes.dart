import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:learning/screens/book_screen.dart';
import 'package:learning/screens/dialog_screen.dart';
import 'package:learning/screens/location_screen.dart';
import 'package:learning/signup_screen.dart';
import 'package:learning/stateful_basics.dart';

class AppRoutes {
  //GoRouter

  //GoRoute

  static final routes = GoRouter(

      //initialLocation: '/signup',
      routes: [
        GoRoute(
          path: '/',
          name: '/',
          builder: (context, state) {
            // return StopWatch();
            return BookDataScreen();
          },
        ),
        GoRoute(
          path: '/signup',
          name: '/signup',
          //builder: (context, state) => const SignUpScreen(),
          pageBuilder: (context, state) => CustomTransitionPage(
            child: SignUpScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(opacity: animation, child: child),
          ),
        ),
        GoRoute(
          path: '/dialogScreen',
          name: "/dialogScreen",
          builder: (context, state) {
            return DialogScreen();
          },
        )
      ]);
}
