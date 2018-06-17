import 'package:flutter/material.dart';
import '../models/Todo.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class Home extends StatefulWidget {
  final List<Todo> todos;


  Home({Key key, @required this.todos}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new HomeState(todos: this.todos);
  }
}

class HomeState extends State<Home>{
  final List<Todo> todos;
  List<String> myTitles = new List();

  HomeState({Key key, @required this.todos});

  @override
  void initState() {
    super.initState();

    var titke = this.getJson().then((List value){
      value.forEach((element){
        setState(() {
          myTitles.add(element["title"].toString());
          print(myTitles);
        });

      });
    });

  }


  @override
  Widget build(BuildContext context) {



    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Screen"),
      ),
      body: new ListView.builder(
          itemCount: myTitles.length -1,
          itemBuilder: (context, index){
            return new ListTile(
              title: new Text(myTitles[index]),
            );
          })
    );
  }


  Future<List<dynamic>> getJson() async {
    String apiURL = "https://jsonplaceholder.typicode.com/posts";

    final response = await http.get(apiURL);

    return json.decode(response.body);

  }
}