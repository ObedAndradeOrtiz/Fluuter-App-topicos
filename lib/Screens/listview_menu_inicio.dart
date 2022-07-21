import 'package:flutter/material.dart';
import 'package:flutter_tickets/Routes/app_routes.dart';
import 'package:flutter_tickets/Screens/alert_screen.dart';

import '../Api/ticket.dart';

String Id='0';
List<ticket> listaTicketsU=[];
class MainScreen extends StatefulWidget {
  MainScreen(String id, List<ticket> listaTickets) {
    Id = id;
    listaTicketsU = listaTickets.toList();
    print('lista main');
    print(listaTicketsU);
  }
  final listOption = const ['Mi Perfil', 'Verificar Entradas', 'Mis Tickets'];
  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    final menuOption = AppRoute.options;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Menu Principal")),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body: ListView.separated(
          itemCount: menuOption.length,
          itemBuilder: (context, index) => ListTile(
                leading: Icon(
                  menuOption[index].icon,
                  color: Colors.indigo,
                ),
                title: Text(menuOption[index].name),
                onTap: () {
                  if (menuOption[index].route == 'tickets') {
                    print('en tickest');
                    final route = MaterialPageRoute(
                        builder: ((context) => AlertScreen(Id,listaTicketsU.toList())));
                    Navigator.push(context, route);
                  } else {
                    Navigator.pushNamed(context, menuOption[index].route);
                  }
                },
              ),
          separatorBuilder: (_, __) => const Divider()),
    );
  }
}
