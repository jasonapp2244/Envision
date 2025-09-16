import 'package:provider_tamplete/utils/routes/routes.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';
import 'package:provider_tamplete/view/bottom_nav_bar.dart';
import 'package:provider_tamplete/view/home_view.dart';
import 'package:provider_tamplete/view/mian_tab.dart';
import 'package:provider_tamplete/viewmodel/auth_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      // home: MianTab(),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
