import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/screens/camera_screen.dart';
import 'package:flinnit/widgets/attachments.dart';
import 'package:flinnit/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.chatUser,
    required this.activeMode,
  });

  final ChatUsers chatUser;
  final Mode activeMode;

  @override
  State<ChatScreen> createState() {
    return _ChatScreenState();
  }
}

class _ChatScreenState extends State<ChatScreen> {
  late String imageName;
  final _controller = TextEditingController();
  var emojiShowing = false;
  final focusNode = FocusNode();

  @override
  void dispose() {
    _controller.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    imageName = widget.chatUser.name
        .substring(0, widget.chatUser.name.indexOf(' '))
        .toLowerCase();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        setState(() {
          emojiShowing = false;
        });
      }
    });
  }

  void _onBackspacePressed() {
    _controller
      ..text = _controller.text.characters.toString()
      ..selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        leadingWidth: 110,
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Avatar(
              mode: widget.activeMode,
              outerRadius: 18,
              gender: widget.chatUser.gender,
            ),
          ],
        ),
        title: Text(
          widget.chatUser.name,
          style: GoogleFonts.amaranth(
            fontSize: 22,
          ),
        ),
        actions: [
          PopupMenuButton(
            offset: Offset(-30, AppBar().preferredSize.height),
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text(
                  'Search',
                  style: GoogleFonts.amaranth(
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Block',
                  style: GoogleFonts.amaranth(
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Report',
                  style: GoogleFonts.amaranth(
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Leave chat',
                  style: GoogleFonts.amaranth(
                    fontSize: 18,
                  ),
                ),
              ),
              PopupMenuItem(
                child: Text(
                  'Clear chat',
                  style: GoogleFonts.amaranth(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(152, 103, 197, 1),
                Color.fromRGBO(225, 210, 239, 0.28),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: PopScope(
          canPop: !emojiShowing,
          onPopInvoked: (onPop) {
            if (emojiShowing) {
              setState(() {
                emojiShowing = false;
              });
            }
          },
          child: Stack(
            children: [
              ListView(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width - 66,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              color: const Color.fromRGBO(245, 233, 255, 1),
                              elevation: 0,
                              child: TextFormField(
                                controller: _controller,
                                focusNode: focusNode,
                                textAlignVertical:
                                    const TextAlignVertical(y: -0.3),
                                keyboardType: TextInputType.multiline,
                                maxLines: 5,
                                minLines: 1,
                                textCapitalization:
                                    TextCapitalization.sentences,
                                style: GoogleFonts.amaranth(fontSize: 18),
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.all(5),
                                  prefixIcon: IconButton(
                                    onPressed: () {
                                      if (emojiShowing) {
                                        focusNode.requestFocus();
                                      } else {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                      }
                                      setState(() {
                                        emojiShowing = !emojiShowing;
                                      });
                                    },
                                    icon: Icon(
                                      (!emojiShowing)
                                          ? Icons.emoji_emotions_outlined
                                          : Icons.keyboard,
                                      color: const Color.fromRGBO(
                                          152, 103, 197, 1),
                                      size: 28,
                                    ),
                                  ),
                                  hintText: "Type a message",
                                  hintStyle: GoogleFonts.amaranth(fontSize: 18),
                                  suffixIcon: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          showModalBottomSheet(
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (ctx) =>
                                                const Attachments(),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.attach_file_outlined,
                                          size: 28,
                                          color:
                                              Color.fromRGBO(152, 103, 197, 1),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (ctx) => const CameraScreen(),
                                            ),
                                          );
                                        },
                                        icon: const Icon(
                                          Icons.camera_alt_outlined,
                                          size: 28,
                                          color:
                                              Color.fromRGBO(152, 103, 197, 1),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor:
                                const Color.fromRGBO(152, 103, 197, 1),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.mic_none,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Offstage(
                      offstage: !emojiShowing,
                      child: SizedBox(
                        height: 250,
                        child: EmojiPicker(
                          textEditingController: _controller,
                          onBackspacePressed: _onBackspacePressed,
                          config: const Config(
                            emojiSizeMax: 30,
                            indicatorColor: Color.fromRGBO(152, 103, 197, 1),
                            iconColorSelected: Color.fromRGBO(152, 103, 197, 1),
                            backspaceColor: Color.fromRGBO(152, 103, 197, 1),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
