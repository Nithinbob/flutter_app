import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_screen.dart';
import 'package:firebase_core/firebase_core.dart';

final _fireStrore = FirebaseFirestore.instance;
User loggedUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_Screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStrore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  String messageText;
  final _controller=TextEditingController();
  @override
  void initState() {
    super.initState();
    getCurrentUser();
//    print(loggedUser.email.toString()  );
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print("AAAAA" + loggedUser.email);
      }
    } catch (e) {
      print("qqqqqqq" + e.toString());
    }
  }
  //
  // void  getChat() async {
  // final messages=await _fireStrore.collection('messages1').getDocuments() ;
  // for (var message in messages.documents){
  //   print(message);
  //
  // }
  //  }

  void messagesStream() async {
    await for (var snapshot
        in _fireStrore.collection('messages1').snapshots()) {
      for (var message in snapshot.documents) {
        print(message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  _auth.signOut();
                  Navigator.pop(context);
                }),
          ],
          title: Text('😍 Chat'),
          backgroundColor: Colors.lightBlueAccent,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
       MessageStream(),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextField(
                          controller:_controller ,
                          onChanged: (value) {
                            messageText = value;
                          },
                          decoration: InputDecoration(
                              hintText: 'Type your message here ..'),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _controller.clear();
                        _fireStrore
                            .collection('messages1')
                            .add({
                              'content': messageText,
                              'sender': loggedUser.email
                            })
                            .then((value) => print('DATA added  $value'))
                            .catchError(
                                (onError) => print("DATA NOT ADDED $onError"));

                        // // get request
                        //  _fireStrore
                        //      .collection('messages1')
                        //      .snapshots()
                        //      .listen((event) {
                        //    event.documents.forEach((element) {
                        //      print("QQQQQQ " + element.data()['content']);
                        //    });
                        //  });
                      },
                      child: Text(
                        'Send',
                        style: kSendButton,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
class MessageStream extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return        StreamBuilder<QuerySnapshot>(
        stream: _fireStrore.collection('messages1').snapshots(),
        builder: (context, snapshot) {
          final messages = snapshot.data.documents.reversed;
          List<MessageBubble> messagesWidgets = [];
          messages.forEach((message) {
            final sender = message.data()['sender'];
            final messageText = message.data()['content'];
            final currentUser=loggedUser.email;

            messagesWidgets.add(MessageBubble(sender: sender,text: messageText,isMe:currentUser==sender));
          });
          return Expanded(
            child: ListView(
              reverse: true,
              children: messagesWidgets,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  final sender;
  final text;
  final isMe;
  MessageBubble({this.sender, this.text,this.isMe});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10) ,
      child: Column(
        crossAxisAlignment: isMe? CrossAxisAlignment.end :CrossAxisAlignment.start,

        children: [
          Text(sender),
          Material(
            borderRadius: BorderRadius.circular(30),
            elevation: 5,
            color: isMe? Colors.lightBlueAccent :Colors.white ,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Text(
                text ,
                style: TextStyle(
                    color:isMe? Colors.white:Colors.lightBlueAccent,
                    fontSize: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
