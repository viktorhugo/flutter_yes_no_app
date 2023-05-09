import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';

import '../../widgets/chat/my_message_bubble.dart';
import '../../widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage:NetworkImage('https://scontent.feoh3-1.fna.fbcdn.net/v/t39.30808-6/271904506_10222041586362885_5873084902373251276_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=174925&_nc_ohc=pdtAIersFSwAX-U-1Vu&_nc_ht=scontent.feoh3-1.fna&oh=00_AfAAGHNp31AGffvRau_HV3X7U_M6CKpqsRopTnsjrmqVlw&oe=645DE054') ,
          ),
        ),
        title: const Text('Mi amor'),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(child: ListView.builder(
              itemCount: 100,
              itemBuilder: (context, index) {
                return (index % 2 == 0) ? const MyMessageBubble() : const HerMessageBubble();
              },
            )),
            const MessageFileBox()
          ],
        ),
      ),
    );
  }
}