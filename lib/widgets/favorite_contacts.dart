import 'package:chat/screens/chat_screen_chat.dart';
import 'package:flutter/material.dart';
import 'package:chat/models/message_model.dart';

class FavoriteContacts extends StatelessWidget {
  const FavoriteContacts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Favorite Contacts',style: TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),),
                IconButton(onPressed: () {},
                    icon: Icon(Icons.more_horiz),
                  iconSize: 30.0,
                  color: Colors.blueGrey,
                )
              ],
            ),
          ),
          Container(
            height: 120.0,

            child: ListView.builder(
              padding: EdgeInsets.only(left: 10.0),
              scrollDirection: Axis.horizontal,
              itemCount: favorites.length,
                itemBuilder: (BuildContext context,int index){
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        user: favorites[index],
                      ),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage: AssetImage(favorites[index].imageUrl),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(favorites[index].name,style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600
                        ),),
                      ],
                    ),
                  ),
                );

                }
            ),

          )
        ],
      ),
    );

  }
}
