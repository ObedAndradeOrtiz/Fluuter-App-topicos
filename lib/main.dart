import 'package:flutter/material.dart';
import 'package:flutter_tickets/Routes/app_routes.dart';
import 'package:flutter_tickets/Screens/login_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp( 
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: AppRoute.getAppRoutes(),
      theme: ThemeData.dark().copyWith(
        primaryColor:Colors.indigo,
        appBarTheme: const AppBarTheme(
          color:Colors.indigo,
        ),
        
      ),
    );
  }
}