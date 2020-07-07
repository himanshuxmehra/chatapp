import 'package:chatapp/model/chat_model.dart';
import 'package:chatapp/model/story_model.dart';
import 'package:chatapp/views/chat.dart';
import 'package:chatapp/views/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/data/data.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Home extends StatefulWidget {
  final String currentuserId;
  Home({Key key, @required this.currentuserId}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<StoryModel> stories = new List();
  List<ChatModel> chats = new List();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    stories = getStories();
    chats = getChats();
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<Null> logoutuser() async {
    await FirebaseAuth.instance.signOut();
    await googleSignIn.disconnect();
    await googleSignIn.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff171719),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              SizedBox(
                height: 70,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Messages",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w600),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff444446),
                          borderRadius: BorderRadius.circular(12)),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xff444446),
                          borderRadius: BorderRadius.circular(12)),
                      child: RaisedButton.icon(
                        icon: Icon(Icons.power_settings_new),
                        color: Colors.white,
                        onPressed: logoutuser,
                        label: Text("Signed Out"),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24),
                height: 110,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: stories.length,
                  itemBuilder: (context, index) {
                    return StoryTitle(
                        imgurl: stories[index].imgurl,
                        username: stories[index].username);
                  },
                ),
              ),
              //chats
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(35),
                        topRight: Radius.circular(35))),
                child: Column(children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Recent",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black45,
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: chats.length,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ChatTile(
                        imgurl: chats[index].imgurl,
                        name: chats[index].name,
                        isunreadmsg: chats[index].isunreadmsg,
                        lastmessage: chats[index].lastmessage,
                        time: chats[index].time,
                        unreadmsgs: chats[index].unreadmsgs,
                      );
                    },
                  ),
                ]),
              ),
            ],
          )),
        ));
  }
}

class StoryTitle extends StatelessWidget {
  String imgurl;
  String username;
  StoryTitle({@required this.imgurl, @required this.username});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.network(
              imgurl,
              height: 70,
              width: 70,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            username,
            style: TextStyle(
                color: Color(0xff78778a),
                fontSize: 16,
                fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  String imgurl;
  String name;
  String lastmessage;
  bool isunreadmsg;
  int unreadmsgs;
  String time;
  ChatTile(
      {@required this.imgurl,
      @required this.name,
      @required this.lastmessage,
      @required this.isunreadmsg,
      @required this.time,
      @required this.unreadmsgs});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ChatScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.network(
                imgurl,
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    lastmessage,
                    style: TextStyle(color: Colors.black54, fontSize: 16),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 14,
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(time),
                  SizedBox(
                    height: 10,
                  ),
                  isunreadmsg
                      ? Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: Color(0xffff4104),
                              borderRadius: BorderRadius.circular(100)),
                          child: Text("$unreadmsgs",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)))
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
