import 'dart:convert';

import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  ChatView(this.userName, this.i);
  final String userName;
  final int i;

  @override
  Widget build(BuildContext context) {
    bool _alignEnd;
    String name;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text("Chat"),
        ),
        body: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assest/data.json"),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              var chats = json.decode(snapshot.data.toString());
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 600,
                      decoration: BoxDecoration(color: Colors.grey[200]),
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: chats["data"][i]["chat${i + 1}"].length,
                          itemBuilder: (BuildContext context, int index) {
                            if (chats["data"][i]["chat${i + 1}"][index]["from"]
                                    ["type"] ==
                                "user2") {
                              _alignEnd = true;
                              name = userName;
                            } else {
                              _alignEnd = false;

                              name = "Friend ${i + 1}";
                            }
                            return Container(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Column(
                                crossAxisAlignment: _alignEnd
                                    ? CrossAxisAlignment.end
                                    : CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.only(left: 15, right: 15),
                                      child: Text(name)),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 15,
                                      right: 15,
                                      top: 10,
                                    ),
                                    padding: EdgeInsets.all(
                                      10,
                                    ),
                                    child: Text(chats["data"][i]["chat${i + 1}"]
                                        [index]["msg"]["message"]),
                                    decoration: BoxDecoration(
                                        color: Colors.blue[200],
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(10),
                                            right: Radius.circular(10))),
                                  )
                                ],
                              ),
                            );
                          })),
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15,
                            right: 15,
                          ),
                          child: SizedBox(
                            width: 250,
                            height: 50,
                            child: TextField(
                              maxLengthEnforced: false,
                              maxLines: null,
                              decoration: InputDecoration(hintText: "message"),
                            ),
                          ),
                        ),

                        // ignore: deprecated_member_use
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 15,
                          ),
                          child: SizedBox(
                              child: RaisedButton(
                                  color: Colors.blue,
                                  onPressed: () {},
                                  child: Text("Send"))),
                        )
                      ],
                    ),
                  )
                ],
              );
            }));
  }
}
