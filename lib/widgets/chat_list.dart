import 'package:flinnit/widgets/chat_tile.dart';
import 'package:flutter/material.dart';
import 'package:flinnit/models/chat_users.dart';

class ChatList extends StatefulWidget {
  const ChatList({super.key});

  @override
  State<ChatList> createState() {
    return _ChatListState();
  }
}

class _ChatListState extends State<ChatList> {
  List<ChatUsers> chatUsers = [
    const ChatUsers(
      name: "Jujhar Singh Channa",
      messageText: "Goo kha lo",
      image: "images/userImage1.jpeg",
      time: "Now",
      gender: Gender.male,
      unreadMessages: 4,
    ),
    const ChatUsers(
      name: "Parth Bajpai",
      messageText: "Time is Money",
      image: "images/userImage2.jpeg",
      time: "Yesterday",
      gender: Gender.male,
      unreadMessages: 2,
    ),
    const ChatUsers(
      name: "Dikshant Aggarwal",
      messageText: "Bas 1.5 km",
      image: "images/userImage3.jpeg",
      time: "31 Mar",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Anantu S Pai",
      messageText: "Maar maarke kutta bana dunga",
      image: "images/userImage4.jpeg",
      time: "28 Mar",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Rutuja Kastewad",
      messageText: "Aee bhagwaannnn",
      image: "images/userImage5.jpeg",
      time: "23 Mar",
      gender: Gender.male,
      unreadMessages: 1,
    ),
    const ChatUsers(
      name: "Yashika Sahu",
      messageText: "Main mar jaungi",
      image: "images/userImage6.jpeg",
      time: "17 Mar",
      gender: Gender.female,
      unreadMessages: 23,
    ),
    const ChatUsers(
      name: "Anshu Patel",
      messageText: "Ae behen ke *****",
      image: "images/userImage7.jpeg",
      time: "24 Feb",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Akshita Ananda",
      messageText: "Main maar dungiiii",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      gender: Gender.female,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Aayush Chodhary",
      messageText: "Lite lo yaar",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Piyush Dalmia",
      messageText: "Suad ka bacha",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Apurv Kshirsagar",
      messageText: "Hamara desh kesa ho, france russia jesa ho",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      gender: Gender.male,
      unreadMessages: 0,
    ),
    const ChatUsers(
      name: "Radha Agrawal",
      messageText: "🤪🤪🤪",
      image: "images/userImage8.jpeg",
      time: "18 Feb",
      gender: Gender.female,
      unreadMessages: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12),
      itemCount: chatUsers.length,
      itemBuilder: (ctx, index) => Column(
        children: [
          (index != 0)
              ? Container(
                  height: 1,
                  color: Colors.black12,
                )
              : SizedBox(),
          ChatTile(
            chatUser: chatUsers[index],
          ),
        ],
      ),
    );
  }
}
