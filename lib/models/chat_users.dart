enum Gender { male, female }

class ChatUsers {
  const ChatUsers({
    required this.name,
    required this.messageText,
    required this.image,
    required this.time,
    required this.gender,
    required this.unreadMessages,
  });

  final String name;
  final String messageText;
  final String image;
  final String time;
  final Gender gender;
  final int unreadMessages;
}
