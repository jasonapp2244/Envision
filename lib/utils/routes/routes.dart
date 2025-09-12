import 'package:provider_tamplete/utils/routes/routes_name.dart';
import 'package:provider_tamplete/view/home_view.dart';
import 'package:provider_tamplete/view/loginview.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings setting) {
    // setting.arguments;
    switch (setting.name) {
      case RoutesName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
      case RoutesName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => Loginview(),
        );

      default:
        RoutesName.home;
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
    }
  }
}
