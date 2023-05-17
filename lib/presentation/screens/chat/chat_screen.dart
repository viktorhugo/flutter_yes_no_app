import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/domain/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat-provider.dart';
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
            backgroundImage:NetworkImage('https://static.wikia.nocookie.net/jujutsu-kaisen/images/a/a2/Satoru_Gojo_-_Anime.jpg/revision/latest?cb=20201017190313&path-prefix=es') ,
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

    final chatProvider = context.watch<ChatProvider>(); // estar pendiente de los cambios
    // que sucedan en esa instancia de la clase

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScrollController,
                itemCount: chatProvider.listMessages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.listMessages[index];

                  return (message.fromWho == FromWho.me) 
                    ? MyMessageBubble(message: message)
                    : HerMessageBubble(message: message);
                },
              )
            ),
            MessageFileBox(
              // onValue: (value) => chatProvider.sendMessage(value)
              onValue: chatProvider.sendMessage
            )
          ],
        ),
      ),
    );
  }
}