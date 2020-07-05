import 'package:chatapp/data/data.dart';
import 'package:chatapp/model/msg_model.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<MsgModel> msgs = new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    msgs = getMsgs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 90,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                "https://images.unsplash.com/photo-1520626337972-ebf863448db6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=625&q=80",
                height: 90,
                width: 90,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
              "Himanshu Mehra",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black87,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 4,
            ),
            Text("4m ago"),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: msgs.length,
                  itemBuilder: (context, index) {
                    return MessagingTile(
                        isbyme: msgs[index].isbyme, msg: msgs[index].text);
                  }),
            )
          ],
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 0),
          child: Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30)),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 30,
                  )),
              Expanded(
                child: TextField(
                  decoration: InputDecoration.collapsed(
                      hintText: "Aa",
                      hintStyle:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.only(left: 5),
                child: Icon(
                  Icons.tag_faces,
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MessagingTile extends StatelessWidget {
  final bool isbyme;
  final String msg;
  MessagingTile({@required this.isbyme, @required this.msg});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: isbyme ? EdgeInsets.only(bottom: 5) : EdgeInsets.only(bottom: 16),
      alignment: isbyme ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: isbyme ? Colors.black38 : Colors.black87,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: isbyme ? Radius.circular(30) : Radius.circular(5),
                bottomRight:
                    isbyme ? Radius.circular(5) : Radius.circular(30))),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        child: Container(
          constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 2 / 3),
          child: Text(
            msg,
            style: TextStyle(
                color: isbyme ? Colors.white : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
