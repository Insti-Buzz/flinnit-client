import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/screens/tabs.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TabsScreen(
        myName: 'Jujhar Singh Channa',
        myGender: Gender.male,
      ),
    ),
  );
}
