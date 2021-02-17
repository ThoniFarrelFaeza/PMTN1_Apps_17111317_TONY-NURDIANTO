import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pmtn1/page/newsDetails.dart';
import 'package:http/http.dart' as http;

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List posts = [];

  Future getData() async {
    try {
      final response = await http.get(
          "http://newsapi.org/v2/everything?q=apple&from=2021-02-15&to=2021-02-15&sortBy=popularity&apiKey=f627c4ada6234fc98722d4dba9d254c7");
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          posts = data['articles'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              color: Colors.grey[200],
              height: 100,
              width: 100,
              child: posts[index]['urlToImage'] != null
                  ? Image.network(
                      posts[index]['urlToImage'],
                      width: 100,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            title: Text(
              '${posts[index]['title']}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  fontSize: 10,
                  fontFamily: 'ReggaeOne',
                  fontWeight: FontWeight.bold,
                  color: Colors.white70),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text(
                '${posts[index]['description']}',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'ReggaeOne',
                    color: Colors.white70),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => (NewsDetails(
                    url: posts[index]['url'],
                    title: posts[index]['title'],
                    content: posts[index]['content'],
                    publishedAt: posts[index]['publishedAt'],
                    author: posts[index]['author'],
                    urlToImage: posts[index]['urlToImage'],
                  )),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
