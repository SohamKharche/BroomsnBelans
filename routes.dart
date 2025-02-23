import 'package:brooms_n_belans/Screens/Customer/homepage_mobile_customer.dart';
import 'package:brooms_n_belans/Screens/Customer/long_term.dart';
import 'package:brooms_n_belans/Screens/Customer/oneoff_book.dart';
import 'package:brooms_n_belans/Screens/Service/Jobs.dart';
import 'package:brooms_n_belans/Screens/Start.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Start();
            } else
              return Start();
          }),
        );
      case '/home':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Homepagemobilecustomer();
            } else
              return Homepagemobilecustomer();
          }),
        );
      case '/oneoff':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return OneoffBook();
            } else
              return OneoffBook();
          }),
        );
      case '/longterm':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LongTerm();
            } else
              return LongTerm();
          }),
        );
      case '/jobs':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return JobLineupScreen();
            } else
              return JobLineupScreen();
          }),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return Start();
            } else
              return Start();
          }),
        );
    }
  }
}
