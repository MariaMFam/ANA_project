import 'package:ana_project/screens/avatar_page.dart';

import 'package:ana_project/screens/category_page.dart';
import 'package:ana_project/screens/home.dart';
import 'package:ana_project/screens/item_details_page.dart';
import 'package:ana_project/screens/item_page.dart';
import 'package:ana_project/screens/settings_page.dart';

import 'package:flutter/material.dart';

import 'bloc/category/category_cubit.dart';

class AppRouter {
  AppRouter();

  final navigatorKey = GlobalKey<NavigatorState>();

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/homepage':
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case '/avatarpage':
        return MaterialPageRoute(
          builder: (_) => const AvatarPage(),
        );
      case '/categorypage':
        return MaterialPageRoute(
          builder: (_) => const CategoryPage(),
        );
      case '/itempage':
        final categoriesItems = settings.arguments! as CategoryArguments;
        return MaterialPageRoute(
          settings: RouteSettings(arguments: categoriesItems),
          builder: (_) => const ItemPage(),
        );
      case '/itemdetailspage':
        final item = settings.arguments! as CategoryItems;
        return MaterialPageRoute(
          settings: RouteSettings(arguments: item),
          builder: (_) => const ItemDetailsPage(),
        );
      case '/settingspage':
        return MaterialPageRoute(
          builder: (_) => const SettingsPage(),
        );
    }
    return null;
  }
}
