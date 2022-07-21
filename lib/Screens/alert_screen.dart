import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tickets/Screens/listview_menu_inicio.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';
import 'dart:js';
import 'package:flutter_tickets/Screens/qrscreen.dart';
import '../Api/ticket.dart';

String iD = '';
List<ticket> listaTicketsU = [];

class AlertScreen extends StatefulWidget {
  AlertScreen(String id, List<ticket> listaTickets) {
    iD = id;
    listaTicketsU = listaTickets;
    print('llegue' + iD);
    if (listaTicketsU.length > 0) {
      print(listaTicketsU[0].idticket);
    }
  }
  @override
  _AlertScreen createState() => _AlertScreen();
}

class _AlertScreen extends State<AlertScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Mis Tickets")),
      ),
      body: ListView.separated(
          itemCount: listaTicketsU.length,
          itemBuilder: (context, index) => ListTile(
                title: Text(listaTicketsU[index].idticket +
                    '   ' +
                    listaTicketsU[index].namesare +
                    ' ' +
                    listaTicketsU[index].name),
                onTap: () {
                  final route = MaterialPageRoute(
                        builder: ((context) => qrscreen(dato:listaTicketsU[index].idticket)));
                    Navigator.push(context, route);
                },
              ),
          separatorBuilder: (_, __) => const Divider()),
    );
  }
}
