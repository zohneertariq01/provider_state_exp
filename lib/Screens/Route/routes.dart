import 'package:api_tutorials/Screens/Favourite/favourite_screen.dart';
import 'package:api_tutorials/Screens/Route/routes_name.dart';
import 'package:api_tutorials/Screens/drawer_screen.dart';
import 'package:api_tutorials/Screens/login_screen.dart';
import 'package:api_tutorials/Screens/provider_screen.dart';
import 'package:api_tutorials/Screens/provider_screen_1.dart';
import 'package:api_tutorials/Screens/theme_screen.dart';
import 'package:api_tutorials/Screens/visibility_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.login:
        return MaterialPageRoute(builder: (context) => LoginScreen());
      case RoutesName.favourite:
        return MaterialPageRoute(builder: (context) => FavouriteScreen());
      case RoutesName.visibility:
        return MaterialPageRoute(builder: (context) => VisibilityScreen());
      case RoutesName.theme:
        return MaterialPageRoute(builder: (context) => ThemeScreen());
      case RoutesName.counter:
        return MaterialPageRoute(builder: (context) => ProviderScreen());
      case RoutesName.slider:
        return MaterialPageRoute(builder: (context) => ProviderScreen1());
      case RoutesName.drawer:
        return MaterialPageRoute(builder: (context) => DrawerScreen());
      default:
        return MaterialPageRoute(
          builder: (_) {
            return Scaffold(
              body: Center(
                child: Text('No route is defined'),
              ),
            );
          },
        );
    }
  }
}
