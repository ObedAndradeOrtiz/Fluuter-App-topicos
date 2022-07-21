import 'package:flutter/cupertino.dart' show IconData,Widget;

class menuOption {
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;
  final String id;
  menuOption({
    required this.route,
    required this.icon, 
    required this.name,
    required this.screen,
    required this.id
  });
}
