import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final url;
  final title;
  final content;
  final publishedAt;
  final author;
  final urlToImage;

  NewsDetails({
    this.url,
    this.title,
    this.content,
    this.publishedAt,
    this.author,
    this.urlToImage,
  });

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
        child: Column(
          children: [
            urlToImage != null
                ? Image.network(urlToImage)
                : Container(
                    color: Colors.grey,
                    height: 250,
                  ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '$title',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$publishedAt', overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'ReggaeOne',
                      color: Colors.white,
                      fontStyle: FontStyle.italic),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '$content', overflow: TextOverflow.ellipsis,maxLines: 5,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'ReggaeOne',
                        color: Colors.white),
                  ),
                  SizedBox(height: 10,),
                  Divider(color: Colors.grey,),
                  Text(
                    '$author',
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'ReggaeOne',
                        color: Colors.white),
                  ),
                  Text(
                    '$url',
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'ReggaeOne',
                        color: Colors.white),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
