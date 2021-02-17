import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/admin/edit_delete_post.dart';

class PostDetails extends StatefulWidget {
  final author;
  PostDetails({this.author});
  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  List post = List();

  Future getAllPost() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/postAll.php";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        post = jsonData;
      });
    }
    print(post);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Posted',
          style: TextStyle(
              fontFamily: 'ReggaeOne',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.yellow),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditDeletePost(
                    author: widget.author,
                  ),
                ),
              ).whenComplete(() {
                getAllPost();
              });
            },
            icon: Icon(
              Icons.add,
            ),
          ),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: post.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              child: ListTile(
                leading: IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditDeletePost(
                          postList: post,
                          index: index,
                          author: widget.author,
                        ),
                      ),
                    ).whenComplete(() {
                      getAllPost();
                    });
                  },
                  icon: Icon(Feather.edit),
                ),
                title: Text(post[index]['title']),
                subtitle: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    post[index]['body'],
                    maxLines: 6,
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.delete),color: Colors.red,
                  onPressed: () {
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
                          'Are You Sure You Want To Delete Post?',
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
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                  fontFamily: 'ReggaeOne',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  color: Colors.white70),
                            ),
                          ),
                          RaisedButton(
                            color: Colors.green,
                            onPressed: () async {
                              var url =
                                  "http://192.168.43.195/pmtn1.wp/Browse/deletePost.php";
                              var response = await http.post(url, body: {
                                "id": post[index]['id'],
                              });
                              if (response.statusCode == 200) {
                                Fluttertoast.showToast(
                                    msg: 'Post Successfully Deleted !!!');

                                setState(() {
                                  getAllPost();
                                });
                                Navigator.pop(context);
                              }
                            },
                            child: Text(
                              'Confirm',
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
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
