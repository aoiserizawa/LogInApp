import 'package:flutter/material.dart';
import './Home.dart';
import '../models/Todo.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}

class LoginState extends State<Login> {
  final TextEditingController _userController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();

  void _clearAction() {
    setState(() {
      this._userController.clear();
      this._passwordController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Login"),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blueGrey,
      body: new Container(
        alignment: Alignment.topCenter,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "assets/person_icon.png",
              width: 90.0,
              height: 90.0,
            ),
            new Container(
              height: 180.0,
              width: 380.0,
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _userController,
                    decoration: new InputDecoration(
                      hintText: "Username",
                      icon: new Icon(Icons.person),
                    ),
                  ),
                  new TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: new InputDecoration(
                      hintText: "password",
                      icon: new Icon(Icons.lock),
                    ),
                  ),
                  new Padding(padding: new EdgeInsets.all(10.5)),
                  new Center(
                    child: new Row(

                      children: <Widget>[
                        new Expanded(
                          child: new RaisedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => new Home(
                                        todos: new List.generate(
                                            20,
                                          (i) => new Todo(
                                              'Todo $i',
                                              'A description of what needs '
                                                  'to be done for Todo $i',
                                          )
                                        ),
                                      )
                                  )
                              );
                            },
                            color: Colors.greenAccent,
                            child: new Text(
                              "Login",
                              style: new TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                        new Padding(padding: new EdgeInsets.all(20.0)),
                        new Expanded(
                          child: new RaisedButton(
                            color: Colors.greenAccent,
                            onPressed: _clearAction,
                            child: new Text(
                              "Clear",
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}