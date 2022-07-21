import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:flutter/material.dart';

String datoU = '';

class qrscreen extends StatelessWidget {
  String dato;
  qrscreen({required this.dato}) : super();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR screen'),
      ),
      body: Center(
        child: Center(
          child: Column(
            children: [QrImage(data: dato)],
          ),
        ),
      ),
    );
  }
}
