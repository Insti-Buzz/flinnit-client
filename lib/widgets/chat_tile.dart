import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/screens/chat_screen.dart';
import 'package:flinnit/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatTile extends StatefulWidget {
  const ChatTile({
    super.key,
    required this.chatUser,
    required this.activeMode,
  });

  final ChatUsers chatUser;
  final Mode activeMode;

  @override
  State<ChatTile> createState() => _ChatTileState();
}

class _ChatTileState extends State<ChatTile> {
  final now = DateTime.now();
  late DateTime today;
  late DateTime dayOfMessage;

  @override
  void initState() {
    super.initState();
    today = DateTime(now.year, now.month, now.day);
    dayOfMessage = DateTime(widget.chatUser.time.year,
        widget.chatUser.time.month, widget.chatUser.time.day);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => ChatScreen(
                  chatUser: widget.chatUser,
                  activeMode: widget.activeMode,
                ),
              ),
            );
          },
          onLongPress: () {},
          leading: Avatar(
            mode: widget.activeMode,
            gender: widget.chatUser.gender,
            outerRadius: 22,
          ),
          title: Text(
            widget.chatUser.name,
            style: GoogleFonts.amaranth(
              fontSize: 19,
              color: const Color.fromRGBO(70, 27, 106, 1),
            ),
          ),
          subtitle: Text(
            widget.chatUser.messageText,
            style: GoogleFonts.amaranth(
              fontSize: 15,
              color: const Color.fromRGBO(50, 38, 83, .6),
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 3),
              Text(
                (dayOfMessage == today)
                    ? formatterNew.format(widget.chatUser.time)
                    : formatterOld.format(widget.chatUser.time),
                style: GoogleFonts.itim(
                  fontSize: 13,
                  color: const Color.fromRGBO(50, 38, 83, 0.77),
                ),
              ),
              const SizedBox(height: 6),
              (widget.chatUser.unreadMessages != 0)
                  ? Container(
                      height: 23,
                      width: 23,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 80, 103, 1),
                      ),
                      child: Center(
                        child: Text(
                          widget.chatUser.unreadMessages.toString(),
                          style: GoogleFonts.itim(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  : const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
