import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;
import 'package:pmtn1/admin/Dashboard.dart';
import 'package:pmtn1/page/login.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController tlp = TextEditingController();
  TextEditingController email = TextEditingController();

  Future signUp() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/register.php";
    var response = await http.post(url, body: {
      "users": user.text,
      "passw": pass.text,
      "tlp": tlp.text,
      "email": email.text
    });
    if (response.statusCode == 200) {
      var userData = json.decode(response.body);
      if (userData == "ERROR") {
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
              'Username has been used !!!',
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
      } else {
        if (userData['status'] == "Admin") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Dashboard(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Login(),
            ),
          );
        }
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
              'Registration Succes..!!',
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
                  'Confirm',
                  style: TextStyle(
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54),
                ),
              ),
            ],
          ),
        );
        print(userData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [Positioned(
          right: 140,
          top: 79,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  FontAwesome.wordpress,
                  color: Colors.black87,
                  size: 100,
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Positioned(
            top: 85,
            right: 132,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'elcome',
                style: TextStyle(
                    fontFamily: 'ReggaeOne',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black87),
              ),
            ),
          ),
        ),
        Container(
          child: Positioned(
            top: 123,
            right: 140,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Text(
                'PMTN1 Apps',
                style: TextStyle(
                    fontFamily: 'ReggaeOne',
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: Colors.black87),
              ),
            ),
          ),
        ),
        Positioned(
          top: 253,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: user,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  prefixIcon: Icon(
                    Feather.user,
                    size: 19,
                    color: Colors.black54,
                  ),
                  hintText: "Input Here....",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
                  labelText: "Username",
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 318,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  prefixIcon: Icon(
                    Feather.lock,
                    size: 19,
                    color: Colors.black54,
                  ),
                  hintText: "Input Here....",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
                  labelText: "Password",
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 382,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: tlp,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  prefixIcon: Icon(
                    Feather.phone,
                    size: 19,
                    color: Colors.green,
                  ),
                  hintText: "Input Here....",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
                  labelText: "Phone Number",
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 446,
          width: MediaQuery.of(context).size.width,
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: email,
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black54),
                  ),
                  prefixIcon: Icon(
                    Feather.mail,
                    size: 19,
                    color: Colors.red,
                  ),
                  hintText: "Input Here....",
                  hintStyle: TextStyle(
                      color: Colors.grey, fontFamily: 'ReggaeOne', fontSize: 12),
                  labelText: "Mail",
                  labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 520,
          width: 200,
          child: Padding(
            padding: const EdgeInsets.all(9.0),
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Card(
                margin: EdgeInsets.all(5.0),
                color: Colors.lightBlue,
                shadowColor: Colors.blue,
                elevation: 2,
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  height: 44,
                  child: InkWell(
                    splashColor: Colors.lightBlue,
                    onTap: () {
                      signUp();
                    },
                    child: Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: "ReggaeOne",
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 650,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Copyright©Tony Nurdianto',
                  style: TextStyle(
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
