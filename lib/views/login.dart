import 'package:chatapp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/data/cons.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    issignedin();
  }

  void issignedin() async {
    this.setState(() {
      isloggedin = true;
    });
    preferences = await SharedPreferences.getInstance();
    isloggedin = await googleSignIn.isSignedIn();
    if (isloggedin) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Home(currentuserId: preferences.getString("id")),
          ));
    }
    setState(() {
      isloading = false;
    });
  }

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences preferences;
  bool isloggedin = false;
  bool isloading = false;
  FirebaseUser currentuser;
  Future<Null> controlSignin() async {
    preferences = await SharedPreferences.getInstance();
    this.setState(() {
      isloading = true;
    });
    GoogleSignInAccount googleuser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuthentication =
        await googleuser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken);
    FirebaseUser firebaseUser =
        (await firebaseAuth.signInWithCredential(credential)).user;
    //Sab changa si
    if (firebaseUser != Null) {
      //Already a user
      final QuerySnapshot resultQuery = await Firestore.instance
          .collection("users")
          .where("id", isEqualTo: firebaseUser.uid)
          .getDocuments();
      final List<DocumentSnapshot> documentsnapshots = resultQuery.documents;
      //if new user
      if (documentsnapshots == 0) {
        Firestore.instance
            .collection("users")
            .document(firebaseUser.uid)
            .setData({
          "nickname": firebaseUser.displayName,
          "photourl": firebaseUser.photoUrl,
          "id": firebaseUser.uid,
          "aboutme": "Smashing!!!",
          "createdAt": DateTime.now().millisecondsSinceEpoch.toString(),
          "chattingWith": null,
        });

        currentuser = firebaseUser;
        await preferences.setString("id", documentsnapshots[0]["id"]);
        await preferences.setString(
            "nickname", documentsnapshots[0]["nickname"]);
        await preferences.setString(
            "photourl", documentsnapshots[0]["photourl"]);
        await preferences.setString("aboutme", documentsnapshots[0]["aboutme"]);
      }
      Fluttertoast.showToast(msg: "Signed In");
      this.setState(() {
        isloading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Home(
                    currentuserId: firebaseUser.uid,
                  )));
    }
    //nothing
    else {
      Fluttertoast.showToast(msg: "Try Again");
      this.setState(() {
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.lightBlueAccent, Colors.black])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text("$name",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  )),
            ),
            SizedBox(height: 50),
            GestureDetector(
              onTap: controlSignin,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(30)),
                child: Column(children: <Widget>[
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  isloading ? CircularProgressIndicator() : Container(),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
