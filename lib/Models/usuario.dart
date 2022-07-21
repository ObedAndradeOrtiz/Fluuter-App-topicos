import 'package:flutter/cupertino.dart';

class user {
  String name = '';
  String email = '';
  String id = '';
  user(this.name, this.email, this.id);
  String getID() {
    return id;
  }
}
