import 'package:api_tutorials/Provider/favourite_class.dart';
import 'package:api_tutorials/Provider/login_class.dart';
import 'package:api_tutorials/Provider/provider_class.dart';
import 'package:api_tutorials/Provider/provider_class_1.dart';
import 'package:api_tutorials/Provider/theme_class.dart';
import 'package:api_tutorials/Provider/visibility_class.dart';
import 'package:api_tutorials/Screens/Route/routes.dart';
import 'package:api_tutorials/Screens/Route/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderClass()),
        ChangeNotifierProvider(create: (_) => ProviderClass1()),
        ChangeNotifierProvider(create: (_) => FavouriteClass()),
        ChangeNotifierProvider(create: (_) => ThemeClass()),
        ChangeNotifierProvider(create: (_) => VisibilityClass()),
        ChangeNotifierProvider(create: (_) => LoginClass()),
      ],
      child: Builder(builder: (BuildContext context) {
        final provider = Provider.of<ThemeClass>(context);
        return MaterialApp(
          themeMode: provider.themeMode,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            appBarTheme: AppBarTheme(
                color: Colors.teal,
                iconTheme: IconThemeData(
                  color: Colors.red,
                )),
          ),
          initialRoute: RoutesName.drawer,
          onGenerateRoute: Routes.generateRoutes,
        );
      }),
    );
  }
}
