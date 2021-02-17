import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:pmtn1/admin/category_details.dart';
import 'package:pmtn1/admin/post_details.dart';
import 'package:pmtn1/page/NotificationPage.dart';
import 'package:pmtn1/page/login.dart';
import 'package:http/http.dart' as http;

class Dashboard extends StatefulWidget {
  final username;
  final email;
  Dashboard({this.username = "Guest", this.email = ""});
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isSeen = true;

  var total;
  Future getTotalunSeenNotification() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/notifComments.php";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        total = response.body;
      });
    }
    print('$total');
  }

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      getTotalunSeenNotification();
    }



  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.yellow, Colors.black],
            ),
          ),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomLeft,
                    colors: [
                      Colors.black,
                      Colors.yellow,
                    ],
                  ),
                ),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      height: 20,
                      child: Row(
                        children: [
                          Icon(
                            Feather.user,
                            size: 45,
                            color: Colors.white70,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                accountName: Text(
                  'Hello Admin.. ' + widget.username,
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white),
                ),
                accountEmail: Text(
                  widget.email,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white),
                ),
              ),
              ListTile(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => MyHomePage()),
                  // );
                },
                leading: Icon(
                  FontAwesome.gitlab,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'Dashboard',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CategoryDetails()),
                  );
                },
                leading: Icon(
                  Feather.folder_plus,
                  color: Colors.amber,
                  size: 20,
                ),
                title: Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PostDetails(
                        author: widget.username,
                      ),
                    ),
                  );
                },
                leading: Icon(
                  Feather.file_plus,
                  color: Colors.blue,
                  size: 20,
                ),
                title: Text(
                  'Post',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold),
                ),
              ),
              widget.username == "Guest"
                  ? ListTile(
                      onTap: () {},
                      leading: Icon(
                        Feather.git_pull_request,
                        color: Colors.cyanAccent,
                        size: 20,
                      ),
                      title: Text(
                        'Contributions',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontFamily: 'ReggaeOne',
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
                      },
                      leading: Icon(
                        Feather.crosshair,
                        color: Colors.redAccent,
                        size: 20,
                      ),
                      title: Text(
                        'None',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 15,
                            fontFamily: 'ReggaeOne',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                },
                leading: Icon(
                  FontAwesome.sign_out,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 5,
        title: Row(
          children: [
            Text(
              'Admin',
              style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 22,
                  fontFamily: 'ReggaeOne',
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'ReggaeOne',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Icon(
                FontAwesome.gitlab,
                color: Colors.yellow,
              ),
            )
          ],
        ),
        actions: [
          isSeen
              ? Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => NotificationPage(),),).whenComplete(()=>getTotalunSeenNotification());
                      debugPrint('seen');
                    },
                    child: Badge(
                      badgeContent: Text('$total'),
                      child: Icon(Icons.notifications_active),
                    ),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: InkWell(
                    onTap: () {},
                    child: Badge(
                      badgeContent: Text(
                        '0',
                        style: TextStyle(color: Colors.white),
                      ),
                      child: Icon(Icons.notifications_none),
                    ),
                  ),
                ),
        ],
      ),
      drawer: menuDrawer(),
      body: ListView(
        children: [
          myGridView(),
        ],
      ),
    );
  }

  Widget myGridView() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Container(
            height: 250,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 5,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.blueGrey,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text('Total post 10'),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomLeft,
                      colors: [
                        Colors.amber,
                        Colors.red,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Text('Total post 20'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
