import 'package:chat/repository/chat_repository.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  String message = "";

  TextEditingController? textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Container(
        child: const Center(
          child: Text("Qui appariranno i messaggi"),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: textEditingController,
                    decoration: const InputDecoration(
                        hintText: "Scrivi un messaggio",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(100.0)),
                        )),
                    onChanged: (value) {
                      setState(() {
                        message = value;
                      });
                    }),
              )),
              IconButton(
                onPressed: message.isEmpty ? null : () {
                  ChatRepository.sendMessage(message);
                  textEditingController?.clear();
                  setState(() {
                    message = "";
                  });
                },
                icon: const Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    textEditingController?.dispose();
    super.dispose();
  }

}
