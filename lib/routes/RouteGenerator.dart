import 'package:flutter/material.dart';
import '../screens/Login.dart';
import '../screens/Register.dart';
import '../screens/Profile.dart';

class AppRoute {
  final String route;
  final WidgetBuilder builder;
  final bool isPublic;

  AppRoute({
    required this.route,
    required this.builder,
    this.isPublic = false,
  });
}

List<AppRoute> routes = [
  AppRoute(route: '/', builder: (context) => Login(), isPublic: true),
  AppRoute(route: '/register', builder: (context) =>  Register(), isPublic: false),
];
