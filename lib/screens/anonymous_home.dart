import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/widgets/chat_list.dart';
import 'package:flutter/material.dart';

class AnonymousHome extends StatefulWidget {
  const AnonymousHome({super.key, required this.activeMode});

  final Mode activeMode;

  @override
  State<AnonymousHome> createState() {
    return _AnonymousHomeState();
  }
}

class _AnonymousHomeState extends State<AnonymousHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(225, 210, 239, 0.28),
            Color.fromRGBO(253, 252, 255, 0),
          ],
          stops: [0.0, 0.2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: ChatList(activeMode: widget.activeMode),
    );
  }
}
