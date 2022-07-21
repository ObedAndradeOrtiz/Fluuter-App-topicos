import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_tickets/Models/menu_oprtion.dart';
import 'package:flutter_tickets/Screens/listview_menu_inicio.dart';
import 'package:flutter_tickets/Screens/login_screen.dart';

import '../Screens/alert_screen.dart';
import '../Screens/perfil_screen.dart';
 String Id='';
class AppRoute {
 
  AppRoute(String id) {
     Id = id;
  }
  static void setId(String id)
  {
      Id = id;
  }
  static const initialRoute = 'login';
  static final options = <menuOption>[
    menuOption(
        route: 'mainscreen',
        icon: Icons.home,
        name: 'Home',
        screen:  MainScreen(Id,[]),
        id: Id),
        
    menuOption(
        route: 'perfilscreen',
        icon: Icons.person,
        name: 'Mi Perfil',
        screen: const PerfilScreen(),id: Id),
    menuOption(
        route: 'tickets',
        icon: Icons.label_outlined,
        name: 'Mis Tickets',
        screen:  AlertScreen(Id,[]),id: Id)
  ];
  static Map<String, Widget Function(BuildContext)> getAppRoutes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};
    for (final option in options) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
  };
}
