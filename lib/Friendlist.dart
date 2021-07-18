import 'dart:convert';

import 'package:chatapp/chat.dart';
import 'package:flutter/material.dart';

class Message extends StatelessWidget {
  Message(this.userName);

  final String userName;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString("assest/data.json"),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          var chats = json.decode(snapshot.data.toString());

          return Scaffold(
              appBar: AppBar(
                title: Text("Messages"),
              ),
              body: Container(
                  padding: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      itemCount: chats["data"].length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            left: 10.0,
                            right: 10,
                            bottom: 5,
                          ),
                          child: Card(
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChatView(userName, index)));
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    margin: EdgeInsets.symmetric(vertical: 10),
                                    child: Text("friend ${index + 1}"),
                                  ))),
                        );
                      })));
        });
  }
}
