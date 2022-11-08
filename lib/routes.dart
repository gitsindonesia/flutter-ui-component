import 'package:flutter/material.dart';
import 'package:gits_flutter_ui_component/main_page.dart';
import 'package:gits_flutter_ui_component/pages/component/text/text.dart';
import 'package:gits_flutter_ui_component/pages/foundation/typography/typhography_page.dart';
import 'package:gits_flutter_ui_component/pages/pages/splash/splash_page.dart';
import 'package:gits_flutter_ui_component/pages/started/home/home_pages.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static List<CategoryNavigation> navigation = [
    CategoryNavigation(
      category: 'Started',
      navigations: [
        Navigation(
          path: '/',
          label: 'Home',
          icon: const Icon(Icons.home),
          child: const HomePage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Foundation',
      navigations: [
        Navigation(
          path: '/typhography',
          label: 'Typhography',
          icon: const Icon(Icons.type_specimen),
          child: const TyphographyPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Component',
      navigations: [
        Navigation(
          path: '/text',
          label: 'Text',
          icon: const Icon(Icons.text_fields),
          child: const TextPage(),
        ),
      ],
    ),
    CategoryNavigation(
      category: 'Pages',
      navigations: [
        Navigation(
          path: '/splash',
          label: 'Splash',
          icon: const Icon(Icons.splitscreen),
          child: const SplashPage(),
        ),
      ],
    ),
  ];

  static GoRouter routes = GoRouter(
    initialLocation: '/',
    navigatorKey: navigatorKey,
    routes: [
      ShellRoute(
        builder: (context, state, child) => MainPage(child: child),
        routes: [
          for (final category in navigation)
            for (final navigation in category.navigations)
              GoRoute(
                path: navigation.path,
                pageBuilder: (context, state) =>
                    NoTransitionPage(child: navigation.child),
              ),
        ],
      ),
    ],
  );
}

class CategoryNavigation {
  CategoryNavigation({
    required this.category,
    required this.navigations,
  });

  final String category;
  final List<Navigation> navigations;
}

class Navigation {
  Navigation({
    required this.path,
    required this.label,
    required this.icon,
    required this.child,
  });

  final String path;
  final String label;
  final Widget icon;
  final Widget child;
}
