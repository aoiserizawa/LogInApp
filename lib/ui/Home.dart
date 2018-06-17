import 'package:flutter/material.dart';
import '../models/Todo.dart';

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

  HomeState({Key key, @required this.todos});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Home Screen"),
      ),
      body: new ListView.builder(
          itemCount: this.todos.length,
          itemBuilder: (context, index){
            return new ListTile(
              title: new Text(todos[index].title),
            );
          })
    );
  }

}