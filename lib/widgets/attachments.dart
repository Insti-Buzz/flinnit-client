import 'package:flinnit/widgets/attachment_button.dart';
import 'package:flutter/material.dart';

class Attachments extends StatefulWidget {
  const Attachments({super.key});

  @override
  State<Attachments> createState() {
    return _AttachmentsState();
  }
}

class _AttachmentsState extends State<Attachments> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: MediaQuery.of(context).size.width,
      child: const Card(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 65),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AttachmentButton(
              text: 'File',
              icon: Icons.insert_drive_file_outlined,
            ),
            AttachmentButton(
              text: 'Gallery',
              icon: Icons.photo,
            ),
            AttachmentButton(
              text: 'Audio',
              icon: Icons.audiotrack_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
