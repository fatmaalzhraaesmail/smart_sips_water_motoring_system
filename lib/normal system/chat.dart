import 'package:flutter/material.dart';
import 'package:graduation_project/shared/style/color.dart';

import '../normal system/navigation.dart';
import '../models/chat_user.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ChatMessage> messages = [
      ChatMessage(messageContent: "Hello, Nada", messageType: "receiver"),
      ChatMessage(
          messageContent: "how can I help you?", messageType: "receiver"),
      ChatMessage(
          messageContent: "Hello admin. My device is not working well ?",
          messageType: "sender"),
      ChatMessage(
          messageContent: "Don't worry, let me see what's wrong here",
          messageType: "receiver"),
      ChatMessage(
          messageContent: "I am waiting for you !", messageType: "sender"),
    ];
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        elevation: 5,
        automaticallyImplyLeading: false,
        backgroundColor: textColor,
        flexibleSpace: SafeArea(
            child: Container(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      (context),
                      MaterialPageRoute(
                          builder: (context) => NavigationScreen()));
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 2,
              ),
              CircleAvatar(
                backgroundImage: AssetImage('image/logo in bar.png'),
                maxRadius: 20,
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Smart Sips",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      "Online",
                      style: TextStyle(
                        color: background,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
              Icon(
                Icons.phone,
                color: Colors.white,
              )
            ],
          ),
        )),
      ),
      body: content(messages),
    );
  }

  Widget content(List<ChatMessage> message) {
    return Stack(
      children: [
        //chat bubble view
        ListView.builder(
            itemCount: message.length,
            itemBuilder: ((context, index) {
              return Container(
                padding:
                    EdgeInsets.only(left: 14, right: 14, top: 10, bottom: 10),
                child: Align(
                  alignment: message[index].messageType == "receiver"
                      ? Alignment.topLeft
                      : Alignment.topRight,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: (message[index].messageType == "receiver")
                            ? Colors.grey.shade200
                            : Colors.blue[200]),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      message[index].messageContent,
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              );
            })),
        Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
            height: 60,
            width: double.infinity,
            color: Colors.white,
            child: Row(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    color: textColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Icon(
                    Icons.add,
                    color: background,
                    size: 20,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                    child: TextField(
                  decoration: InputDecoration(
                      hintText: "Write message...",
                      hintStyle: TextStyle(color: Colors.black54),
                      border: InputBorder.none),
                )),
                SizedBox(
                  width: 15,
                ),
                FloatingActionButton(
                  onPressed: () {},
                  child: Icon(
                    Icons.send,
                    color: background,
                    size: 18,
                  ),
                  backgroundColor:textColor,
                  elevation: 0,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
