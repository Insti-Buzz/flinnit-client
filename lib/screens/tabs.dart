import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/presentation/flinnit_icon_icons.dart';
import 'package:flinnit/screens/anonymous_home.dart';
import 'package:flinnit/screens/community_home.dart';
import 'package:flinnit/screens/events_home.dart';
import 'package:flinnit/widgets/anonymous_drawer.dart';
import 'package:flinnit/widgets/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flinnit/data/chat_users.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({
    required this.myName,
    required this.myGender,
    super.key,
  });

  final String myName;
  final Gender myGender;

  @override
  State<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends State<TabsScreen> {
  var _selectedPageIndex = 0;
  late Widget activePage;
  Mode activeMode = Mode.flinnMate;

  @override
  void initState() {
    super.initState();
    activePage = AnonymousHome(activeMode: activeMode);
  }

  void selectTab(index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        activePage = AnonymousHome(activeMode: activeMode);
      } else if (_selectedPageIndex == 1) {
        activePage = const CommunityHome();
      } else if (_selectedPageIndex == 2) {
        activePage = const EventsHome();
      }
    });
  }

  int get numberOfUnopenedChats {
    int counter = 0;

    for (int i = 0; i < chatUsers.length; i++) {
      if (chatUsers[i].unreadMessages != 0) {
        counter++;
      }
    }

    return counter;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: double.infinity,
      appBar: AppBar(
        title: Text(
          'Flinnit',
          style: GoogleFonts.amaranth(
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              size: 28,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.myGender == Gender.female)
                  ? const Color.fromRGBO(255, 141, 199, 1)
                  : const Color.fromRGBO(69, 109, 209, 1),
            ),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: PopupMenuButton(
                offset: Offset(-5, AppBar().preferredSize.height),
                itemBuilder: (ctx) => [
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        activeMode = Mode.flinnDate;
                        activePage = AnonymousHome(activeMode: activeMode);
                      });
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Avatar(
                              mode: Mode.flinnDate,
                              outerRadius: 16,
                              gender: widget.myGender,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Flinn-Date',
                              style: GoogleFonts.amaranth(fontSize: 20),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () {
                      setState(() {
                        activeMode = Mode.flinnMate;
                        activePage = AnonymousHome(activeMode: activeMode);
                      });
                    },
                    child: Row(
                      children: [
                        Avatar(
                          gender: widget.myGender,
                          outerRadius: 16,
                          mode: Mode.flinnMate,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Flinn-Mate',
                          style: GoogleFonts.amaranth(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                ],
                icon: Icon(
                  (activeMode == Mode.flinnMate)
                      ? Icons.emoji_emotions
                      : Icons.heart_broken,
                  // size: 28,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          )
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 152, 103, 197),
                Color.fromRGBO(225, 210, 239, 0.28),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),
      drawer: AnonymousDrawer(
        activeMode: activeMode,
        myGender: widget.myGender,
        myName: widget.myName,
      ),
      body: activePage,
      floatingActionButton: (_selectedPageIndex == 0)
          ? FloatingActionButton(
              onPressed: () {},
              // splashColor: const Color.fromRGBO(50, 38, 83, 0.2),
              shape: const CircleBorder(eccentricity: 0),
              child: const Icon(
                Icons.add,
                size: 35,
                color: Color.fromRGBO(50, 38, 83, 1),
              ),
            )
          : null,
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
          boxShadow: [
            BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
          child: BottomNavigationBar(
            selectedIconTheme: const IconThemeData(size: 25),
            unselectedIconTheme: const IconThemeData(size: 22),
            selectedItemColor: Colors.white,
            unselectedItemColor: const Color.fromRGBO(255, 141, 199, 1),
            selectedFontSize: 0,
            unselectedFontSize: 0,
            backgroundColor: const Color.fromRGBO(152, 103, 197, 1),
            onTap: selectTab,
            currentIndex: _selectedPageIndex,
            items: [
              BottomNavigationBarItem(
                icon: Stack(
                  children: [
                    const Icon(FlinnitIcon.teenyicons_chat_outline),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Text(
                          numberOfUnopenedChats.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    )
                  ],
                ),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(FlinnitIcon.vector),
                label: '',
              ),
              const BottomNavigationBarItem(
                icon: Icon(FlinnitIcon.vector__1_),
                label: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
