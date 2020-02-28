import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  List data;

  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("http://cet.ahmad.ly/api/groups"),
        headers: {"Accept": "application/json"});
    List data = json.decode(response.body);
    print(data[0]["name"]);

    return "Geted!";
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new RaisedButton(
            child: new Text("GET"),
            onPressed: getData,
          ),
          Text(
            'Look Down For the Terminal',
            style: TextStyle(fontSize: 22),
          ),
        ],
      ),
    );
  }
}

/*most of the code from this video https://www.youtube.com/watch?v=m7b7_Nq7XSs*/
