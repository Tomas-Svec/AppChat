import 'package:app_chat/domain/entities/message.dart';
import 'package:app_chat/presentation/providers/chat_provider.dart';
import 'package:app_chat/presentation/widgets/chat/her_message_bubble.dart';
import 'package:app_chat/presentation/widgets/chat/my_message_bubble.dart';
import 'package:app_chat/presentation/widgets/shared/message_field_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(2.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZfLXG8hfqIxC06-yJAm5SOVD1cqORcjj-LA&s'),
          ),
        ),
        title: const Text("Mi Amor"),
        centerTitle: false,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider =
        context.watch<ChatProvider>(); //Dibuja el widget con provider

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    controller: chatProvider.chatScrollController,
                    itemCount: chatProvider
                        .messageList.length, //Ver cuantos mensajes hay
                    itemBuilder: (context, index) {
                      /*return (index % 2 == 0) //Alternar los mensajes
                          ? const HerMessageBubble()
                          : const MyMessageBubble(); */

                      final message = chatProvider.messageList[index];
                      return (message.fromWho == FromWho.hers)
                          ? HerMessageBubble(message: message)
                          : MyMessageBubble(message: message);
                    })),

            // Todo Caja de Texto
            MessageFieldBox(
              onValue: chatProvider.sendMessage, //Mandar el mensaje
            ),
          ],
        ),
      ),
    );
  }
}
