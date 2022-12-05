import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_4traderx/app/navigation/navigator.dart';
import 'package:test_4traderx/views/pages/mail_login.dart';
import 'package:test_4traderx/views/pages/nav_bar.dart';

import '../../views/pages/nav_bar.dart';

class AppRouter {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case navBar:
        return getPageRoute(
          settings: settings,
          view: const NavBar(),
        );

      case login:
        return getPageRoute(
          settings: settings,
          view: const MailLogin(),
        );

      default:
        return getPageRoute(
          settings: settings,
          view: Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static PageRoute<dynamic> getPageRoute({
    required RouteSettings settings,
    required Widget view,
  }) {
    return Platform.isIOS
        ? CupertinoPageRoute(settings: settings, builder: (_) => view)
        : MaterialPageRoute(settings: settings, builder: (_) => view);
  }
}
