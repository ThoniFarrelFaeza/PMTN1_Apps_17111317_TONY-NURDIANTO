import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

class EditDeleteCategory extends StatefulWidget {
  final categoryList;
  final index;
  EditDeleteCategory({this.categoryList, this.index});

  @override
  _EditDeleteCategoryState createState() => _EditDeleteCategoryState();
}

class _EditDeleteCategoryState extends State<EditDeleteCategory> {
  TextEditingController categoryName = TextEditingController();

  bool editMode = false;

  Future editDeleteCategory() async {
    if (categoryName.text != "") {
      if (editMode) {
        var url = "http://192.168.43.195/pmtn1.wp/Browse/updateCategory.php";
        var response = await http.post(url, body: {
          "id": widget.categoryList[widget.index]['id'],
          "names": categoryName.text
        });
        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Update Success !!!');
          Navigator.pop(context);
          print(categoryName.text);
        }
      } else {
        var url = "http://192.168.43.195/pmtn1.wp/Browse/addCategory.php";
        var response = await http.post(url, body: {"names": categoryName.text});
        if (response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Success !!!');
          Navigator.pop(context);
          print(categoryName.text);
        }
      }
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.index != null) {
      editMode = true;
      categoryName.text = widget.categoryList[widget.index]['names'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: categoryName,
              obscureText: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black54),
                ),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(
                    Feather.edit_3,
                    size: 25,
                    color: Colors.black54,
                  ),
                ),
                hintText: "Input Here....",
                hintStyle: TextStyle(
                    color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 14),
                labelText: "Categories",
                labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
              ),
            ),
          ),
          Row(
            children: [
              Card(
                margin: EdgeInsets.only(left: 10),
                color: Colors.black87,
                shadowColor: Colors.white,
                elevation: 5,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 32,
                  width: 67,
                  child: InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      editDeleteCategory();
                    },
                    child: Center(
                      child: Text(
                        editMode ? 'Update' : 'Save',
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: "ReggaeOne",
                            color: Colors.white70,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
