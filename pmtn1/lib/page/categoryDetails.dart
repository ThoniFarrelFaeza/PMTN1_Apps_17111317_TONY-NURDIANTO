import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/page/postDetails.dart';

class CategoryDetails extends StatefulWidget {
  final categoryName;
  CategoryDetails({this.categoryName});
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List categoryDetails = List();

  Future categoryData() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/categoryDetail.php";
    var response = await http.post(url, body: {'names': widget.categoryName});
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryDetails = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.blue, Colors.black],
            ),
          ),
        child: ListView.builder(
            itemCount: categoryDetails.length,
            itemBuilder: (context, index) {
              return NewPostItem(
                author: categoryDetails[index]['author'],
                body: categoryDetails[index]['body'],
                categoryName: categoryDetails[index]['category_name'],
                comments: categoryDetails[index]['comments'],
                image:
                    "http://192.168.43.195/pmtn1.wp/Browse/Uploads/${categoryDetails[index]['images']}",
                postDate: categoryDetails[index]['post_date'],
                totalLike: categoryDetails[index]['total_like'],
                createDate: categoryDetails[index]['create_date'],
                title: categoryDetails[index]['title'],
              );
            }),
      ),
    );
  }
}

class NewPostItem extends StatefulWidget {
  final image;
  final author;
  final postDate;
  final comments;
  final totalLike;
  final title;
  final body;
  final categoryName;
  final createDate;
  NewPostItem(
      {this.image,
      this.author,
      this.postDate,
      this.comments,
      this.totalLike,
      this.title,
      this.body,
      this.categoryName,
      this.createDate});

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
            decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.amber, Colors.redAccent],
              ),
            ),
            //color: Colors.amber,
          ),
        ),
        Positioned(
          top: 30,
          left: 30,
          child: CircleAvatar(
            radius: 20,
            //child: Icon(Icons.person),
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
          left: 190,
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
            color: Colors.white60,
          ),
        ),
        Positioned(
          top: 50,
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
            color: Colors.white60,
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
            color: Colors.white60,
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
                    title: widget.title,
                    image: widget.image,
                    author: widget.author,
                    body: widget.body,
                    postDate: widget.postDate,
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
