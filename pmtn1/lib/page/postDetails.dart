import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'login.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PostDetails extends StatefulWidget {
  final id;
  final title;
  final image;
  final body;
  final author;
  final postDate;
  final userEmail;
  PostDetails(
      {this.id,
      this.title,
      this.image,
      this.body,
      this.author,
      this.postDate,
      this.userEmail = ""});

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  TextEditingController commentsController = TextEditingController();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  Future addComents() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/addComments.php";
    var response = await http.post(url, body: {
      "comment": commentsController.text,
      "user_email": widget.userEmail,
      "post_id": widget.id,
    });
    if (response.statusCode == 200) {
      showNotification();
      Fluttertoast.showToast(msg: 'Comments Publish Success !!!');
      Navigator.pop(context);
    }
    print(addComents);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var android = AndroidInitializationSettings('@mipmap/ic_launcher');
    var ios = IOSInitializationSettings();
    var initilize = InitializationSettings(android: android,iOS: ios);
    flutterLocalNotificationsPlugin.initialize(initilize,onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async {
    if (payload != null) {
      debugPrint("Notification : "+payload);
  
    }
  }

  Future showNotification() async{
    var android = AndroidNotificationDetails('chanelId', 'chanelName', 'chanelDescription');
    var ios = IOSNotificationDetails();
    var platform = NotificationDetails(android: android,iOS: ios);
    flutterLocalNotificationsPlugin.show(0, 'Sending Messege to Admin', commentsController.text, platform,payload: 'some detail value');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 5,
        title: Row(
          children: [
            Text(
              "Details",
              style: TextStyle(
                  fontFamily: 'ReggaeOne',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                "Post",
                style: TextStyle(
                    fontFamily: 'ReggaeOne',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 1),
              child: Container(
                height: 250,
                width: 1500,
                child: Container(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Image.network(
                      widget.image,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.title,
                      style: TextStyle(
                          fontFamily: 'ReggaeOne',
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: Container(),
                  ),
                  IconButton(
                    icon: Icon(Feather.thumbs_up),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Like');
                    },
                  ),
                  IconButton(
                    icon: Icon(Feather.thumbs_down),
                    onPressed: () {
                      Fluttertoast.showToast(msg: 'Dislike');
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.body == null ? "" : widget.body,
                style: TextStyle(
                  fontFamily: 'ReggaeOne',
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.author,
                    style: TextStyle(
                        fontFamily: 'ReggaeOne',
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "Posted: " + widget.postDate,
                    style: TextStyle(
                        fontFamily: 'ReggaeOne',
                        fontSize: 12,
                        color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text(
                          'Comments :',
                          style: TextStyle(
                              fontFamily: 'ReggaeOne',
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Container(
                          width: 330,
                          child: TextField(
                            onSubmitted: (value) {
                              commentsController.text = value;
                            },
                            onChanged: (value) {
                              if (widget.userEmail == "") {
                                showDialog(
                                  context: (context),
                                  builder: (context) => AlertDialog(
                                    title: Text(
                                      'Message From Server : 192.168.43.195',
                                      style: TextStyle(
                                          fontFamily: 'ReggaeOne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black54),
                                    ),
                                    content: Text(
                                      'Please login first Comments ',
                                      style: TextStyle(
                                          fontFamily: 'ReggaeOne',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black54),
                                    ),
                                    actions: [
                                      RaisedButton(
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => Login(),
                                            ),
                                          );
                                          debugPrint("First Login");
                                        },
                                        child: Text(
                                          'Login',
                                          style: TextStyle(
                                              fontFamily: 'ReggaeOne',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13,
                                              color: Colors.white70),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            controller: commentsController,
                            decoration: InputDecoration(
                              labelText: '',
                            ),
                          ),
                        ),
                        Expanded(
                          child: IconButton(
                            icon: Icon(
                              FontAwesome.send_o,
                              color: Colors.black54,
                            ),
                            onPressed: () {
                              addComents();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
