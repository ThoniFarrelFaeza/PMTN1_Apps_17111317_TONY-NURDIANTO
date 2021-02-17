import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List allNotification = List();

  Future notification() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/notifSeen.php";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        allNotification = jsonData;
      });
    }
    print(allNotification);
  }

  Future switchnotification(String id) async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/switch.php";
    var response = await http.post(url, body: {"id": id});
    if (response.statusCode == 200) {
      print('OK!!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text('Notification'),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: allNotification.length,
            itemBuilder: (context, index) {
              var list = allNotification[index];
              return Card(
                elevation: 5,
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
                child: ListTile(
                  title: Text(
                    list['comment'],
                    style: TextStyle(
                        fontFamily: "ReggaeOne",
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: IconButton(
                    icon: Icon(FontAwesome.check_circle),
                    onPressed: () {
                      switchnotification(list['id'])
                          .whenComplete(() => notification());
                    },
                  ),
                ),
              );
            }),
      ),
    );
  }
}
