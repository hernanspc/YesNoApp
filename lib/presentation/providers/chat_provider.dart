import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/entities/message.dart';

class ChatProvider extends ChangeNotifier {
  List<Message> message = [
    Message(text: 'Hola Mor', fromWho: FromWho.me),
    Message(text: 'Ya regresaste del trabajo?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage() async {
    //todo: Implementar metodo
  }
}
