import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:pmtn1/components/News.dart';
import 'package:pmtn1/page/aboutUs.dart';
import 'package:pmtn1/page/contribution.dart';
import 'package:pmtn1/page/login.dart';
import 'package:pmtn1/page/playlist.dart';
import 'package:pmtn1/page/register.dart';
import 'components/CategoryListItem.dart';
import 'components/TopPostCard.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PMTN Apps',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final username;
  final email;

  MyHomePage({this.username = "Guest", this.email = ""});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var curdate = DateFormat("d MMMM y").format(DateTime.now());

  // TextEditingController searchController = TextEditingController();

  List searchList = [];

  Future showAllPost() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/postAll.php";
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var i = 0; i < jsonData.length; i++) {
        searchList.add(jsonData[i]['title']);
      }
      print(searchList);
      // return jsonData;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    showAllPost();
  }

  @override
  Widget build(BuildContext context) {
    Widget menuDrawer() {
      return Drawer(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.black],
            ),
          ),
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.centerLeft,
                  colors: [Colors.blue, Colors.black],
                )),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: SizedBox(
                      height: 10,
                      child: Row(
                        children: [
                          Icon(
                            Feather.user,
                            size: 45,
                            color: Colors.amber,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                accountName: Text(
                  'Hello.. ' + widget.username,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white),
                ),
                accountEmail: Text(
                  widget.email,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(
                  Feather.home,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Contribution()),
                    ),
                  );
                  debugPrint('');
                },
                leading: Icon(
                  FontAwesome.users,
                  color: Colors.white70,
                  size: 20,
                ),
                title: Text(
                  'Contribution',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (AboutUs()),
                    ),
                  );
                  debugPrint('');
                },
                leading: Icon(
                  FontAwesome.exclamation,
                  color: Colors.white70,
                  size: 20,
                ),
                title: Text(
                  'About Us',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (MyHomePage()),
                    ),
                  );
                  debugPrint('');
                },
                leading: Icon(
                  Feather.user_check,
                  color: Colors.white70,
                  size: 20,
                ),
                title: Text(
                  'Sign Out Account',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Login()),
                    ),
                  );
                  debugPrint('');
                },
                leading: Icon(
                  Feather.log_in,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'SignIn',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => (Login()),
                    ),
                  );
                  debugPrint('');
                },
                leading: Icon(
                  FontAwesome.sign_out,
                  color: Colors.white,
                  size: 20,
                ),
                title: Text(
                  'Sign Out',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
              Divider(
                height: 10,
                color: Colors.white,
              ),
              widget.username == "Guest"
                  ? ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => (Register()),
                          ),
                        );
                        debugPrint('Register');
                      },
                      leading: Icon(
                        Feather.user,
                        color: Colors.lime,
                        size: 20,
                      ),
                      title: Text(
                        'Register',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'ReggaeOne',
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                    )
                  : ListTile(),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            height: 130,
            width: 140,
            child: TextField(
              style: TextStyle(
                  color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
                prefixIcon: IconButton(
                  onPressed: () {
                    showSearch(
                        context: context,
                        delegate: SerachPost(list: searchList));
                  },
                  icon: Icon(
                    FontAwesome.search,
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: menuDrawer(),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.blue, Colors.black],
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'News',
                style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'ReggaeOne',
                    fontWeight: FontWeight.bold,
                    color: Colors.amber),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    curdate,
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ReggaeOne',
                        color: Colors.white54),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Feather.calendar,
                    color: Colors.white54,
                  ),
                ),
              ],
            ),
            TopPostCard(
              userEmail: widget.email,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Top Categories",
                style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'ReggaeOne',
                  color: Colors.amber,
                ),
              ),
            ),
            CategoryListItem(),
           News(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 35,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(Feather.tv,color: Colors.white,size: 20,),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (context)=>Playtube()));
              },
            ),
            
          ],
        ),
      ),
    );
  }
}

class SerachPost extends SearchDelegate<String> {
  List<dynamic> list;
  SerachPost({this.list});

  List searchTitle = List();

  Future showAllPost() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/searchPost.php";
    var response = await http.post(url, body: {'title': query});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);

      return jsonData;
    }
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
          showSuggestions(context);
        },
        icon: Icon(
          Icons.close,
          color: Colors.black,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: showAllPost(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                var list = snapshot.data[index];
                return Column(
                  children: [
                    Container(
                      child: Image.network(
                        'http://192.168.43.195/pmtn1.wp/Browse/Uploads/${list['images']}',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        list['title'],
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'ReggaeOne',
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list['body'] == null ? "" : list['body'],
                        style: TextStyle(
                          fontFamily: 'ReggaeOne',
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            list['author'],
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Posted : " + list['post_date'],
                            style: TextStyle(
                                fontFamily: 'ReggaeOne',
                                fontSize: 12,
                                color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Divider(),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     Padding(

                    //       padding: const EdgeInsets.all(8.0),
                    //       child: Text(
                    //         "Comments Area :",
                    //         style: TextStyle(
                    //           fontSize: 10,

                    //           fontFamily: 'ReggaeOne',
                    //           color: Colors.grey
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                );
              });
        }
        return CircularProgressIndicator();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var listData = query.isEmpty
        ? list
        : list
            .where(
              (element) => element.toLowerCase().contains(query),
            )
            .toList();
    return listData.isEmpty
        ? Center(
            child: Text(
            'No Data Found',
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ))
        : ListView.builder(
            itemCount: listData.length,
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () {
                  query = listData[index];
                  showResults(context);
                },
                title: Text(listData[index]),
              );
            });
  }
}
