import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  Future<List> getData() async {
    final response =
        await http.get("http://192.168.43.195/pmtn1.wp/Browse/copyright.php");
    return json.decode(response.body);
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
        child: Stack(
          children: [
            Positioned(
              left: 50,
              top: 120,
              width: 370,
              child: Container(
                child: Image.asset('images/banner.Png'),
              ),
            ),
            Container(
              child: Positioned(
                left: 140,
                top: 240,
                child: Container(
                  child: Text(
                    'PMTN1',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'ReggaeOne',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
              ),
            ),
            Container(
              child: Positioned(
                left: 240,
                top: 245,
                child: Container(
                  child: Text(
                    'Apps',
                    style: TextStyle(
                        color: Colors.blue,
                        fontFamily: 'ReggaeOne',
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ),
              ),
            ),
            Container(
              child: Positioned(
                  left: 120,
                  top: 300,
                  child: Container(
                    child: Text(
                      'Aplikasi yang bertema tentang seputar berita',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ReggaeOne',
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
            ),
            Positioned(
                  left: 120,
                  top: 320,
                  child: Container(
                    child: Text(
                      'paling terupdate dan terpopuler',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'ReggaeOne',
                          fontWeight: FontWeight.bold,
                          fontSize: 10),
                    ),
                  ),
                ),
            FutureBuilder<List>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) print(snapshot.error);
                return snapshot.hasData
                    ? new ItemList(
                        list: snapshot.data,
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 600,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                list[index]['name'],
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'ReggaeOne',
                    fontWeight: FontWeight.bold,
                    fontSize: 10),
              ),
            ),
          ],
        );
      },
    );
  }
}
