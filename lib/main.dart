import 'package:provider_tamplete/res/components/app_color.dart';
import 'package:provider_tamplete/utils/routes/routes.dart';
import 'package:provider_tamplete/utils/routes/routes_name.dart';
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
      // home: ProfileView(),
       theme: ThemeData(
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: AppColor.darkgreen,
          selectionColor: AppColor.darkgreen.withValues(alpha: 0.5),
          selectionHandleColor: AppColor.darkgreen,
        ),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splash,
      onGenerateRoute: Routes.generateRoutes,
    );
  }
}
