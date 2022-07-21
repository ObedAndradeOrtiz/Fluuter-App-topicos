import 'package:flutter/material.dart';
import 'package:flutter_tickets/Api/ticket.dart';
import 'package:flutter_tickets/Models/usuario.dart';
import 'package:flutter_tickets/Routes/app_routes.dart';
import 'package:flutter_tickets/Screens/alert_screen.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'dart:convert';
import 'dart:js';

import 'listview_menu_inicio.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> main(String emal, String password) async {
      final client = RetryClient(http.Client());
      JsArray jsonUsers;
      try {
        var response = await http
            .get(Uri.parse('https://apiseventos.herokuapp.com/api/session'));
        var jsonUsers = jsonDecode(response.body);
        var responseTicket = await http
            .get(Uri.parse('https://apiseventos.herokuapp.com/api/ticket'));
         List<ticket> Listickets = [];
        var jsonTickets = jsonDecode(responseTicket.body);
         print(jsonTickets);
         for (final jsonTicket in jsonTickets) {
           final ticketEvent = new ticket(
                idticket: jsonTicket['id'].toString(),
                name: jsonTicket['name_event'].toString(),
                namesare: jsonTicket['name_area'].toString());
               Listickets.add(ticketEvent);
         }
        for (final jsonUser in jsonUsers) {
          if (jsonUser['email'] == emal) {
            AppRoute.setId(jsonUser['id'].toString());
            final route = MaterialPageRoute(
                builder: ((context) => MainScreen(jsonUser['id'].toString(),Listickets.toList())));
            Navigator.push(context, route);
            print(jsonUser['id']);
            user(jsonUser['name'].toString(), jsonUser['email'].toString(),
                jsonUser['id'].toString());
            return;
          }
        }
        // print(jsonUsers);
      } finally {
        client.close();
      }
    }

    final GlobalKey<FormState> MyFormkey = GlobalKey<FormState>();
    final Map<String, String> FormValues = {
      'email': 'email',
      'password': 'password',
      'role': 'role'
    };
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("Iniciar Sesion")),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Form(
                  key: MyFormkey,
                  child: Column(
                    children: [
                       const SizedBox(height: 50),
                      TextFormField(
                        autofocus: true,
                        initialValue: 'obed@gmail.com',
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value) {
                          FormValues['email'] = value;
                        },
                        validator: (value) {
                          if (value == null) return 'Este campo es requerido';
                        },
                        decoration: const InputDecoration(
                            hintText: 'Email  de Usuario',
                            labelText: 'Email',
                            suffixIcon: Icon(Icons.email),
                            icon: Icon(Icons.assignment_ind_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10)))),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        autofocus: true,
                        initialValue: '',
                        obscureText: true,
                        onChanged: (value) {
                          FormValues['password'] = value;
                        },
                        validator: (value) {
                          if (value == null) return 'Este campo es requerido';
                        },
                        decoration: const InputDecoration(
                            hintText: 'Contraeña de Usuario',
                            labelText: 'Contraseña',
                            suffixIcon: Icon(Icons.password),
                            icon: Icon(Icons.security),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10)))),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                          onPressed: () {
                            if (!MyFormkey.currentState!.validate()) {
                              print('Formualrio no valido');
                              return;
                            }
                            main(FormValues['email'].toString(),
                                FormValues['password'].toString());
                            print(FormValues);
                          },
                          child: const SizedBox(
                            width: double.infinity,
                            child: Center(child: Text('Ingresar')),
                          ))
                    ],
                  ))),
        ));
  }
}
