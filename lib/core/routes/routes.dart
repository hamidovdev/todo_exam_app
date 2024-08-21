import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/routes_name/route_names.dart';
import 'package:todo_app/features/calendar/data/model/model.dart';
import 'package:todo_app/features/calendar/presentation/pages/calendar_screen.dart';
import 'package:todo_app/features/calendar/presentation/pages/info_page.dart';
import 'package:todo_app/features/create/presentation/pages/create_page.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.home:
        return CupertinoPageRoute(
          builder: (context) => const CalendarScreen(),
        );
      case AppRouteNames.info_page:
        return CupertinoPageRoute(
          builder: (context) => const InfoScreen(),
        );
      case AppRouteNames.create_task_page:
        return CupertinoPageRoute(
          builder: (context) => CreateScreen(
            todo: settings.arguments != null
                ? settings.arguments as TodoModel
                : null,
          ),
        );
      default:
        return CupertinoPageRoute(
          builder: (context) => const Scaffold(),
        );
    }
  }
}
