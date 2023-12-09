  import 'package:mymovie/view/BottomNavigation/BottomNavigation.dart';
  import 'package:flutter/cupertino.dart';
  import 'package:flutter/material.dart';

  import 'package:mymovie/view/Splash_Screen/Splash_Screen.dart';

  class RouteGenerator {
    static final RouteGenerator _generator = RouteGenerator._init();

    static RouteGenerator get router => _generator;

    RouteGenerator._init();

    Route? onGenerate(RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return navigate(const IntroductionPage());
        case '/bottomnavigationbar':
          return navigate(const BottomNavigationBarWidget());
      }
      return null;
    }

    navigate(Widget widget) {
      return MaterialPageRoute(builder: (context) => widget);
    }
  }
