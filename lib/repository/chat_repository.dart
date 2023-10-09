
import 'package:chat/data/Message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ChatRepository {

  static Future<bool> sendMessage(String text) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final userEmail = auth.currentUser?.email;

    if(userEmail == null) {
      debugPrint("Utente non loggato");
      return false;
    }

    try {
      final message = Message(
          text: text,
          sender: userEmail);

      final database = FirebaseDatabase.instance;
      final messagesRef = database.ref("messages");
      final messageRef = messagesRef.push();
      await messageRef.set({
        "text": message.text,
        "sender": message.sender,
      });
      return true;
    }
    catch (e) {
      debugPrint("Errore durante l'invio del messaggio");
      return false;
    }

  }

}