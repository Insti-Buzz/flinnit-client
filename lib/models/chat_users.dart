import 'package:intl/intl.dart';

enum Gender { male, female }

enum Mode { flinnDate, flinnMate }

final formatterNew = DateFormat.jm(); 
final formatterOld = DateFormat.MMMd();

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
  final DateTime time;
  final Gender gender;
  final int unreadMessages;
}
