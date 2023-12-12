import 'package:flinnit/models/chat_users.dart';
import 'package:flinnit/widgets/avatar.dart';
import 'package:flinnit/widgets/drawer_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnonymousDrawer extends StatefulWidget {
  const AnonymousDrawer({
    required this.myName,
    required this.myGender,
    required this.activeMode,
    super.key,
  });

  final String myName;
  final Gender myGender;
  final Mode activeMode;

  @override
  State<AnonymousDrawer> createState() {
    return _AnonymousDrawerState();
  }
}

class _AnonymousDrawerState extends State<AnonymousDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(152, 103, 197, 1),
              Color.fromRGBO(152, 103, 197, 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.3],
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              height: 275,
              child: Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Avatar(
                      mode: widget.activeMode,
                      gender: widget.myGender,
                      outerRadius: 22,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        widget.myName,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.amaranth(
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SideDrawerButton(
              buttonText: 'Profile',
              buttonIcon: Icons.person_outline_outlined,
            ),
            const SizedBox(height: 5),
            const SideDrawerButton(
              buttonText: 'Settings',
              buttonIcon: Icons.privacy_tip_outlined,
            ),
            const SizedBox(height: 5),
            const SideDrawerButton(
              buttonText: 'Invite a friend',
              buttonIcon: Icons.person_add_alt_1_outlined,
            ),
            const SizedBox(height: 5),
            const SideDrawerButton(
              buttonText: 'Help',
              buttonIcon: Icons.headset_mic_outlined,
            ),
            const SizedBox(height: 5),
            const SideDrawerButton(
              buttonText: 'Flinnit Tour',
              buttonIcon: Icons.rocket_launch_outlined,
            ),
            const SizedBox(height: 5),
            const SideDrawerButton(
              buttonText: 'Feedback',
              buttonIcon: Icons.feedback_outlined,
            ),
            const Spacer(),
            Text(
              'Developed with ❤️',
              style: GoogleFonts.amaranth(
                fontSize: 20,
                color: const Color.fromRGBO(97, 37, 112, 1),
              ),
            ),
            const SizedBox(width: 2),
            Text(
              'RKP',
              style: GoogleFonts.amaranth(
                fontSize: 20,
                color: const Color.fromRGBO(97, 37, 112, 1),
              ),
            ),
            Text(
              '2023 Version 2.0',
              style: GoogleFonts.amaranth(
                fontSize: 10,
                color: const Color.fromRGBO(97, 37, 112, 1),
              ),
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
