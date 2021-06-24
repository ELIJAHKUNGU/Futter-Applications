import 'package:flutter/material.dart';
import 'package:chat/models/message_model.dart';
import 'package:chat/models/user_model.dart';
import 'package:flutter/rendering.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({required this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {


  _bulidMessage(Message message,bool Isme){
    final msg = Container(
        margin:Isme ? EdgeInsets.only(top: 8.0,bottom: 8.0,left: 80.0) :
        EdgeInsets.only(top:8.0,bottom: 8.0,),
        padding: EdgeInsets.symmetric(horizontal: 25.0,vertical: 15.0),
        width: MediaQuery.of(context).size.width * 0.75,

        decoration: BoxDecoration(
          color: Isme ? Theme.of(context).accentColor : Color(0xFFFFEFEE),
          borderRadius: Isme
              ? BorderRadius.only(
            topLeft: Radius.circular(15.0),
            bottomLeft: Radius.circular(15.0),
          )
              : BorderRadius.only(
            topRight: Radius.circular(15.0),
            bottomRight: Radius.circular(15.0),
          ),
        ),
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message.time,style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight:FontWeight.w600,
            ),),
            SizedBox(height: 10.0),
            Text(message.text,style: TextStyle(
              color: Colors.blueGrey,
              fontSize: 16.0,
              fontWeight:FontWeight.w600,
            ),),
          ],
        )
    );
    if(Isme){
      return msg;
    }
    return Row(
      children: [
        msg,
        IconButton(onPressed: (){},
          icon: message.isLiked ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          iconSize: 30.0,
          color: message.isLiked ? Theme.of(context).primaryColor: Colors.blueGrey,
            ),
      ],
    );
  }

  _bulidMessageComposer(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      height: 70.0,
      color: Colors.white,
      child: Row(
        
        children: [

          IconButton(onPressed: (){},
              icon: Icon(Icons.photo),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
          ),
          Expanded(
              child: TextField(
                textCapitalization: TextCapitalization.sentences,
                onChanged: (value){

                },
                decoration: InputDecoration.collapsed(
                  hintText: 'send a message....',
                ),
              )

          ),
          IconButton(onPressed: (){},
            icon: Icon(Icons.send),
            iconSize: 25.0,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text(
          widget.user.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            iconSize: 30.0,
            color: Colors.white,
          )
        ],
        elevation: 0.0,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0))),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)
                  ),
                  child: ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.only(top: 15.0),
                    itemCount: messages.length,
                      itemBuilder:(BuildContext context,int index){
                      final Message message = messages[index];

                       final bool Isme = message.sender.id == currentUser.id;
                      return _bulidMessage(message,Isme);
                      }),
                ),
              ),
            ),
            _bulidMessageComposer()
          ],
        ),
      ),
    );
  }
}
