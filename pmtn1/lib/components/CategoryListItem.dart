import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/page/categoryDetails.dart';

class CategoryListItem extends StatefulWidget {
  @override
  _CategoryListItemState createState() => _CategoryListItemState();
}

class _CategoryListItemState extends State<CategoryListItem> {
  List categories = List();

  Future getAllCategory() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/categoryAll.php";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categories = jsonData;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return CategoryItem(
              categoryName: categories[index]["names"],
            );
          }),
    );
  }
}

class CategoryItem extends StatefulWidget {
  final categoryName;
  CategoryItem({this.categoryName});
  @override
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: InkWell(
          child: Text(
            widget.categoryName,
            style: TextStyle(
              fontSize: 18,
              fontFamily: 'Berylium',
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryDetails(
                  categoryName: widget.categoryName,
                ),
              ),
            );
            debugPrint(widget.categoryName);
          },
        ),
      ),
    );
  }
}
