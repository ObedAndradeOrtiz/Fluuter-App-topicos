import 'package:flutter/material.dart';

class PerfilScreen extends StatelessWidget {
   
  const PerfilScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("MI PERFIL")),
        elevation: 0,
        backgroundColor: Colors.indigo,
      ),
      body:const  Text("PERFIL"),
    );
  }
}