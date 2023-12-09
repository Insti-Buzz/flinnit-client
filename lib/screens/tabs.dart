import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/screens/anonymous_home.dart';
import 'package:flinnit/screens/community_home.dart';
import 'package:flinnit/screens/events_home.dart';
import 'package:flinnit/widgets/anonymous_drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  Widget activePage = const AnonymousHome();

  void selectMode(index) {
    setState(() {
      _selectedPageIndex = index;
      if (_selectedPageIndex == 0) {
        activePage = const AnonymousHome();
      } else if (_selectedPageIndex == 1) {
        activePage = const CommunityHome();
      } else if (_selectedPageIndex == 2) {
        activePage = const EventsHome();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEdgeDragWidth: double.infinity,
      appBar: AppBar(
        // toolbarHeight: 80,
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
            // height: 50,
            // width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: (widget.myGender == Gender.female)
                  ? const Color.fromRGBO(255, 141, 199, 1)
                  : const Color.fromRGBO(69, 109, 209, 1),
            ),
            child: CircleAvatar(
              // radius: 22,
              backgroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(
                  Icons.emoji_emotions,
                  // size: 28,
                ),
                onPressed: () {},
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
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectMode,
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Event',
          ),
        ],
      ),
    );
  }
}
