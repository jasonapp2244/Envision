import 'package:provider_tamplete/utils/routes/routes_name.dart';
import 'package:provider_tamplete/view/Setting_view.dart';
import 'package:provider_tamplete/view/activitylogs_view.dart';
import 'package:provider_tamplete/view/bottom_nav_bar.dart';
import 'package:provider_tamplete/view/change_password_view.dart';
import 'package:provider_tamplete/view/home_view.dart';
import 'package:provider_tamplete/view/last_viewed_content_view.dart';
import 'package:provider_tamplete/view/loginview.dart';
import 'package:flutter/material.dart';
import 'package:provider_tamplete/view/mian_tab.dart';
import 'package:provider_tamplete/view/sginupview.dart';
import 'package:provider_tamplete/view/splash_view.dart';
import 'package:provider_tamplete/view/suggestion_view.dart';

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
      case RoutesName.activitylogsView:
        return MaterialPageRoute(
          builder: (BuildContext context) => ActivitylogsView(),
        );
      case RoutesName.lastviewedcontentview:
        return MaterialPageRoute(
          builder: (BuildContext context) => LastViewedContentView(),
        );
      case RoutesName.miantab:
        return MaterialPageRoute(builder: (BuildContext context) => MianTab());
      case RoutesName.signup:
        return MaterialPageRoute(
          builder: (BuildContext context) => Sginupview(),
        );
      case RoutesName.mainScreenHolder:
        return MaterialPageRoute(
          builder: (BuildContext context) => MainScreen(),
        );
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashView(),
        );
      case RoutesName.contentPreferenceScreen:
        return MaterialPageRoute(
          builder: (BuildContext context) => ContentPreferenceScreen(),
        );
      case RoutesName.chnagePassword:
        return MaterialPageRoute(
          builder: (BuildContext context) => ChangePasswordScreen(),
        );
      case RoutesName.setting:
        return MaterialPageRoute(
          builder: (BuildContext context) => SettingView(),
        );
      // case RoutesName.setting:
      //   return MaterialPageRoute(
      //     builder: (BuildContext context) => SettingView(),
      //   );
      // ChangePasswordScreen
      default:
        RoutesName.home;
        return MaterialPageRoute(builder: (BuildContext context) => HomeView());
    }
  }
}
