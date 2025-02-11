import 'package:app_chat/config/helpers/get_yes_no_answer.dart';
import 'package:app_chat/domain/entities/message.dart';
import 'package:flutter/material.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final getYesNoAnsewer = GetYesNoAnsewr();

  List<Message> messageList = [
    /*Message(text: 'Hola amor!', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),*/
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;
    // TODO: implementar metodo

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messageList.add(newMessage);

    if (text.endsWith('?')) {
      herReply();
    }

    notifyListeners(); //Notificar el cambio del widget
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnsewer.getAnswer();
    messageList.add(herMessage);
    notifyListeners();

    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    //Mover el scroll hacia abajo

    await Future.delayed(const Duration(milliseconds: 100));

    chatScrollController.animateTo(
        chatScrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut);
  }
}
