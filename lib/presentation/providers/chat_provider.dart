import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  final ScrollController chatScollController = ScrollController();

  List<Message> messagesList = [
    Message(text: 'Hola Mor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 300));

    chatScollController.animateTo(
      chatScollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      // curve: Curves.easeOut,
      curve: Curves.easeInBack,

      // curve: Curves.linear,
    );
  }
}
