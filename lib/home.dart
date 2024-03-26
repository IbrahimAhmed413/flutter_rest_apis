import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
              child: Text(
            "Rest API Call",
            style: TextStyle(color: Colors.white),
          )),
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            final user = users[index];
            final email = user['email'];
            return ListTile(
              title: Text(email),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchuser,
          backgroundColor: Colors.blue,
        ));
  }

  fetchuser() async {
    print("Fetch Users Called");
    const url = 'https://randomuser.me/api/?results=3';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    setState(() {
      users = json['results'];
    });
    print("Fetch Completed");
  }
}
