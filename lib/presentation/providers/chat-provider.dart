import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier {

  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();
  final ScrollController chatScrollController = ScrollController();

  List<Message> listMessages = [
    Message(text: 'Hi sweetie', fromWho: FromWho.her),
    Message(text: 'Did you come back from work?', fromWho: FromWho.me)
  ];
  
  Future<void> sendMessage(String msg) async {
    if (msg.isEmpty) return;
    final newMessage = Message(text: msg, fromWho: FromWho.me);
    listMessages.add(newMessage);

    if(msg.endsWith('?')){
      await herReply(msg);
    }

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply(String msg) async {
    final herMessage = await getYesNoAnswer.getAnswer();
  }

  void moveScrollToBottom() {
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, //quiero que baya al maximo que el scroll puede dar 
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

}