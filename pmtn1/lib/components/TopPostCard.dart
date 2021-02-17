import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/page/postDetails.dart';

class TopPostCard extends StatefulWidget {
  final userEmail;
  TopPostCard({this.userEmail});



  @override
  _TopPostCardState createState() => _TopPostCardState();
}

class _TopPostCardState extends State<TopPostCard> {
  List postData = List();

  Future showAllPost() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/postAll.php";
    var response = await http.get(url, headers: {"Accept": "application/json"});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        postData = jsonData;
      });
      print(jsonData);
      return jsonData;
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
    return Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        // color: Colors.amber,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: postData.length,
            itemBuilder: (context, index) {
              return NewPostItem(
                id: postData[index]['id'],
                author: postData[index]['author'],
                body: postData[index]['body'],
                categoryName: postData[index]['category_name'],
                comments: postData[index]['comments'],
                image:
                    'http://192.168.43.195/pmtn1.wp/Browse/Uploads/${postData[index]['images']}',
                postDate: postData[index]['post_date'],
                totalLike: postData[index]['total_like'],
                createDate: postData[index]['create_date'],
                title: postData[index]['title'],
                userEmail: widget.userEmail,
              );
            }));
  }
}

class NewPostItem extends StatefulWidget {
  final id;
  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;
  final userEmail;
  NewPostItem(
      {this.id,
        this.image,
      this.author,
      this.postDate,
      this.comments,
      this.totalLike,
      this.title,
      this.body,
      this.categoryName,
      this.createDate,
      this.userEmail});

  @override
  _NewPostItemState createState() => _NewPostItemState();
}

class _NewPostItemState extends State<NewPostItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 200,
            width: MediaQuery.of(context).size.width,
            color: Colors.white54,
            // decoration: BoxDecoration(
            //   color: Colors.amber,
            //   borderRadius: BorderRadius.circular(10),
            //   gradient: LinearGradient(
            //     begin: Alignment.topRight,
            //     end: Alignment.bottomLeft,
            //     colors: [Colors.amber, Colors.redAccent],
            //   ),
            // ),
            //color: Colors.amber,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CircleAvatar(
            radius: 20,
            //child: Icon(Icons.person),
            backgroundColor: Colors.transparent,
            backgroundImage: NetworkImage(
              widget.image,
            ),
          ),
        ),
        Positioned(
          top: 30,
          left: 80,
          child: Text(
            widget.author,
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Positioned(
          top: 30,
          left: 300,
          child: Text(
            widget.postDate,
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Positioned(
          top: 50,
          left: 100,
          child: Icon(
            Icons.comment_outlined,
            color: Colors.black54,
          ),
        ),
        Positioned(
          top: 52,
          left: 130,
          child: Text(
            widget.comments,
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Positioned(
          top: 48,
          left: 170,
          child: Icon(
            Feather.bookmark,
            color: Colors.black54,
          ),
        ),
        Positioned(
          top: 52,
          left: 200,
          child: Text(
            widget.totalLike,
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Positioned(
          top: 100,
          left: 30,
          child: Text(
            widget.title,
            style: TextStyle(
                fontFamily: 'ReggaeOne',
                fontWeight: FontWeight.bold,
                color: Colors.black54),
          ),
        ),
        Positioned(
          top: 147,
          left: 22,
          child: Icon(
            Icons.arrow_back,
            color: Colors.black54,
            size: 20,
          ),
        ),
        Positioned(
          top: 150,
          left: 50,
          child: InkWell(
            child: Text(
              "Read More",
              style: TextStyle(
                  fontFamily: 'ReggaeOne',
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetails(
                    id: widget.id,
                    title: widget.title,
                    image: widget.image,
                    author: widget.author,
                    body: widget.body,
                    postDate: widget.postDate,
                    userEmail: widget.userEmail,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
