import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/admin/edit_delete_category.dart';

class CategoryDetails extends StatefulWidget {
  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  List category = List();

  Future getAllCategory() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/categoryAll.php";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        category = jsonData;
      });
    }
    print(category);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Categories',
          style: TextStyle(
              fontFamily: 'ReggaeOne',
              fontWeight: FontWeight.bold,
              fontSize: 15,
              color: Colors.yellow),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add_outlined),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditDeleteCategory()),
              ).whenComplete(() {
                setState(() {
                  getAllCategory();
                });
              });
            },
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  leading: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditDeleteCategory(
                            categoryList: category,
                            index: index,
                          ),
                        ),
                      ).whenComplete(() {
                        setState(() {
                          getAllCategory();
                        });
                      });
                    },
                    icon: Icon(
                      Feather.edit,
                      size: 25,
                    ),
                  ),
                  title: Text(category[index]['names']),
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
                            'Are You Sure You Want To Delete?',
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
                                    "http://192.168.43.195/pmtn1.wp/Browse/deleteCategory.php";
                                var response = await http.post(url,
                                    body: {"id": category[index]['id']});
                                if (response.statusCode == 200) {
                                  Fluttertoast.showToast(
                                      msg: 'Category Successfully Deleted !!!');

                                  setState(() {
                                    getAllCategory();
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
            }),
      ),
    );
  }
}
