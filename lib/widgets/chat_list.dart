import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flinnit/data/chat_users.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key, required this.activeMode});

  final Mode activeMode;

  @override
  State<ChatList> createState() {
    return _ChatListState();
  }
}

class _ChatListState extends State<ChatList> {
  // List<ChatUsers> dateChatUsers = chatUsers.where((chatUsers[index].gender != myGender) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: chatUsers.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          ChatTile(
            activeMode: widget.activeMode,
            chatUser: chatUsers[index],
          ),
          Container(
            height: 1,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}
