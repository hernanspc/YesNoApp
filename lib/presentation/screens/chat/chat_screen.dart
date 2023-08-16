import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:yes_no_app/presentation/entities/message.dart';
import 'package:yes_no_app/presentation/providers/chat_provider.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/shared/message_field_box.dart';
import 'package:yes_no_app/utils/utils.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  File? image;

  void selectImage() async {
    // print('s');
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      print('Ruta de la imagen seleccionada: ${pickedImage.path}');
    }

    // image = await pickImage(context);
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => selectImage(),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                'https://esp.unbilgi.com/wp-content/uploads/2021/05/Lana-Rhoades-Facts.jpg',
                // 'https://techstory.in/wp-content/uploads/2022/02/lana-rhoades-fb-1.jpg',
              ),
            ),
          ),
        ),
        title: const Text('Lana de Rey'),
        centerTitle: true,
      ),
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {
  const _ChatView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(horizontal: 10),

        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.chatScollController,
                itemCount: chatProvider.messagesList.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messagesList[index];

                  return (message.fromWho == FromWho.hers)
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(
                          message: message,
                        );
                },
              ),
            ),
            const SizedBox(height: 10),
            MessageFieldBox(
              onValue: (value) => chatProvider.sendMessage(value),
            ),
          ],
        ),
      ),
    );
  }
}
