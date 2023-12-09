import 'package:flinnit/models/chat_users.dart';
import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({required this.gender, super.key});

  final Gender gender;

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 55,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: (gender == Gender.female)
            ? const Color.fromRGBO(255, 141, 199, 1)
            : const Color.fromRGBO(69, 109, 209, 1),
      ),
      child: const CircleAvatar(
        // backgroundImage: NetworkImage(widget.image),
        radius: 22,
        backgroundColor: Colors.white,
        child: Icon(Icons.emoji_emotions),
      ),
    );
  }
}
