import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pmtn1/admin/Dashboard.dart';
import 'package:pmtn1/main.dart';
import 'package:pmtn1/page/register.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future login() async {
    var url = "http://192.168.43.195/pmtn1.wp/Browse/login.php";
    var response = await http.post(url, body: {
      "users": user.text,
      "passw": pass.text,
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
              'Login Failed..!! Please Check Username or Pasword..!!',
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
                child: Text('Back'),
              ),
            ],
          ),
        );
      } else {
        if (userData['status'] == "admin") {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Dashboard(
                  username: userData['users'],
                  email: userData['email'],
                ),
              ));
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(
                username: userData['users'],
                email: userData['email'],
              ),
            ),
          );
        }
        Fluttertoast.showToast(msg: 'Login Success',);
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
              'Wellcome To My Apps',
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
        print(userData);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: Colors.white70,
        ),
        Positioned(
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
          top: 250,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
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
                        color: Colors.grey,
                        fontFamily: 'ReggaeOne',
                        fontSize: 12),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 318,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
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
                        color: Colors.grey,
                        fontFamily: 'ReggaeOne',
                        fontSize: 12),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black54, fontSize: 15),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 390,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(7.0),
                child: Card(
                  margin: EdgeInsets.all(6),
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
                        login();
                      },
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontSize: 20,
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
        ),
        Positioned(
          top: 460,
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Create Account :',
                  style: TextStyle(
                      fontFamily: 'ReggaeOne',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black54),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Positioned(
            right: 163,
            top: 485,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(
                      FontAwesome.youtube,
                      color: Colors.red,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (Register()),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Positioned(
            right: 133,
            top: 485,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(
                      FontAwesome.linkedin,
                      color: Colors.blue,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (Register()),
                        ),
                      );
                      debugPrint('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          child: Positioned(
            right: 103,
            top: 485,
            width: MediaQuery.of(context).size.width,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    child: Icon(
                      FontAwesome.apple,
                      color: Colors.black,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => (Register()),
                        ),
                      );
                      debugPrint('');
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 550,
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
                      color: Colors.grey),
                ),
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
