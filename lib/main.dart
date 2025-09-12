import 'package:provider_tamplete/view/doctor_view.dart';
import 'package:provider_tamplete/view/home_view.dart';
import 'package:provider_tamplete/view/info_ciew.dart';
import 'package:provider_tamplete/view/mian_tab.dart';
import 'package:provider_tamplete/view/splash_view.dart';
import 'package:provider_tamplete/view/suggestion_view.dart';
import 'package:provider_tamplete/viewmodel/auth_viewmodel.dart';
import 'package:provider_tamplete/viewmodel/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_adaptive_ui/responsive_adaptive_ui.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthViewmodel())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainTabScreen(),
      // initialRoute: RoutesName.login,
      // onGenerateRoute: Routes.generateRoutes,
    );
  }
}
