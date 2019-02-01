import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPost() async {
  try {
    final response =
    await http.get(new Uri.http('150.162.18.196:43774', '/users'))
              .timeout(new Duration(seconds: 5));

    return Post.fromJson(json.decode(response.body));
  }
  catch(error) {
    print(error.toString());
  }
}

class Post {
  final String name;
  final String username;
  final int password;

  Post({this.name, this.username, this.password});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      name: json['name'],
      username: json['username'],
      password: json['password'],
    );
  }
}

void main() => runApp(MyApp(post: fetchPost()));

class MyApp extends StatelessWidget {
  final Future<Post> post;

  MyApp({Key key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: post,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.username);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}