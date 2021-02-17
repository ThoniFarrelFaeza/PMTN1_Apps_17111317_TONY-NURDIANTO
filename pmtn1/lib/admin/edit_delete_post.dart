import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:image_picker/image_picker.dart';
// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class EditDeletePost extends StatefulWidget {
  final postList;
  final index;
  final author;
  EditDeletePost({this.postList, this.index, this.author});

  @override
  _EditDeletePostState createState() => _EditDeletePostState();
}

class _EditDeletePostState extends State<EditDeletePost> {
  File _image;
  final picker = ImagePicker();

  String selectedCategory;
  List categoryItem = List();

  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  bool editMode = false;

  Future choiceImage() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future choiceCamera() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future editDeletePost() async {
    if (editMode) {
      var uri =
          Uri.parse("http://192.168.43.195/pmtn1.wp/Browse/updatePost.php");
      var request = http.MultipartRequest("POST", uri);
      request.fields['id'] = widget.postList[widget.index]['id'];
      request.fields['title'] = title.text;
      request.fields['body'] = body.text;
      request.fields['author'] = widget.author;
      request.fields['category_name'] = selectedCategory;

      var pic = await http.MultipartFile.fromPath('images', _image.path,
          filename: _image.path);
      request.files.add(pic);

      var response = await request.send();

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: ' Update Success !!!');
        Navigator.pop(context);
        print(title.text);
      }
    } else {
      var uri = Uri.parse("http://192.168.43.195/pmtn1.wp/Browse/addPost.php");
      var request = http.MultipartRequest("POST", uri);
      request.fields['title'] = title.text;
      request.fields['body'] = body.text;
      request.fields['author'] = widget.author;
      request.fields['category_name'] = selectedCategory;

      var pic = await http.MultipartFile.fromPath('images', _image.path,
          filename: _image.path);
      request.files.add(pic);

      var response = await request.send();

      if (response.statusCode == 200) {
        Fluttertoast.showToast(msg: 'Success !!!');
        Navigator.pop(context);
        print(title.text);
      }
    }
  }

  Future getAllCategory() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/categoryAll.php";
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        categoryItem = jsonData;
      });
    }
    print(categoryItem);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllCategory();
    if (widget.index != null) {
      editMode = true;
      title.text = widget.postList[widget.index]['title'];
      body.text = widget.postList[widget.index]['body'];
      selectedCategory = widget.postList[widget.index]['category_name'];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.red[800], Colors.yellow[800], Colors.green[900]],
          ),
        ),
        child: ListView(
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 350,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: _image == null ? Text("") : Image.file(_image),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                Center(
                  child: SizedBox(
                    height: 150,
                    width: 350,
                    child: FittedBox(
                      fit: BoxFit.fill,
                      child: editMode
                          ? Image.network(
                              "http://192.168.43.195/pmtn1.wp/Browse/Uploads/${widget.postList[widget.index]['images']}")
                          : Text(''),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Feather.image, color: Colors.black45),
                  onPressed: choiceImage,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: Icon(Feather.camera, color: Colors.black45),
                    onPressed: choiceCamera,
                  ),
                ),
                Expanded(
                  child: Container(),
                ),
                IconButton(
                  icon: Icon(
                    Feather.send,
                    color: Colors.black45,
                    size: 20,
                  ),
                  onPressed: () {
                    editDeletePost();
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLength: 30,
                controller: title,
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
                      color: Colors.black54,
                      fontFamily: 'ReggaeOne',
                      fontSize: 14),
                  labelText: "Titles",
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: body,
                maxLines: 6,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(15.0),
                  ),
                  hintText: "Input Here....",
                  hintStyle: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'ReggaeOne',
                      fontSize: 14),
                  labelText: "",
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: DropdownButton(
                    value: selectedCategory,
                    hint: Text(
                      'Select Category',
                      style: TextStyle(
                          fontSize: 17,
                          fontFamily: 'ReggaeOne',
                          color: Colors.black87),
                    ),
                    items: categoryItem.map((category) {
                      return DropdownMenuItem(
                        value: category['names'],
                        child: Text(category['names']),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategory = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
