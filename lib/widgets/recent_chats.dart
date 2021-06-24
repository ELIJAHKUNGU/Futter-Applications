import 'package:chat/screens/chat_screen_chat.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/screens/chat_screen_chat.dart';
class RecentChats extends StatelessWidget {
  const RecentChats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
          child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) {
                final Message chat = chats[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: chat.sender,
                      ),
                    ),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20.0),
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        color: chat.unread ? Color(0xFFFFEFEE) : Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          topLeft: Radius.circular(20),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 35.0,
                              backgroundImage: AssetImage(chat.sender.imageUrl),
                            ),
                            SizedBox(width: 10.0),
                            Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start, //Alignment to left
                              children: [
                                Text(
                                  chats[index].sender.name,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                                SizedBox(height: 5.0),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.45,
                                  child: Text(
                                    chat.text,
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              chat.time,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 15.0,
                              ),
                            ),
                            chat.unread
                                ? Container(
                                    height: 20.0,
                                    width: 40.0,
                                    decoration: BoxDecoration(
                                        color: Theme.of(context).primaryColor,
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    alignment: Alignment.center,
                                    child: Center(
                                        child: Text(
                                      'NEW',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.0),
                                    )))
                                :
                                /* SizedBox.shrink(),*/
                                Text(''),
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
