import 'package:flutter/material.dart';
import 'package:flutter_tickets/Api/ticket.dart';

class TicketScreen extends StatelessWidget {
  String id;
  String title;
  String area;
  TicketScreen({required this.id,required this.title,required this.area}) : super();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Text('hola'));
  }
}
