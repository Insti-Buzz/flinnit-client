import 'package:flinnit/widgets/chat_list.dart';
import 'package:flutter/material.dart';

class AnonymousHome extends StatefulWidget {
  const AnonymousHome({super.key});

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
      child: const ChatList(),
    );
  }
}
