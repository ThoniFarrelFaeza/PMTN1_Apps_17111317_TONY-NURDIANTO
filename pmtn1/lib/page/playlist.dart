import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:http/http.dart' as http;


class Playtube extends StatefulWidget {
  final String title;
  final String url;
  Playtube({this.title, this.url});

  @override
  _PlaytubeState createState() => _PlaytubeState();
}

class _PlaytubeState extends State<Playtube> {
  Future<List> getData() async {
    final response = await http.get("https://pmtn12.herokuapp.com/");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Row(
          children: [
            Text('YouTube'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(FontAwesome.youtube_play,color: Colors.red,size: 30,),
            ),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  "https://cdn.cnnindonesia.com/cnnid/images/Logo-CNN-Indonesia-Peta-Indonesia.jpg?v=8.3.1"),
              fit: BoxFit.cover),
        ),
        height: double.infinity,
        child: FutureBuilder<List>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new ListVideo(
                      list: snapshot.data,
                    )
                  : new CircularProgressIndicator();
            }),
      ),
    );
  }
}

class ListVideo extends StatelessWidget {
  final List list;
  ListVideo({this.list});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: list == null ? 0 : list.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: (){},
                    child: Container(
                      height: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(list[index]['snippet']['thumbnails']
                                ['high']['url']),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      list[index]['snippet']['title'],
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'ReggaeOne',
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Divider(color: Colors.white,),
                ],
              ),
            );
          }),
    );
  }
}

// class VideoPlay extends StatelessWidget {
//   final String url;
//   VideoPlay({this.url});
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: WebviewScaffold(
//         url: url,
//       ),
//     );
//   }
// }

// url: "https://youtube.com/embed/${list[index]['contentDetails']['videoId']}",