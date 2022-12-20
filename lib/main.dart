import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  _MyAppState() {
    xererere.add(Text('తాళపత్రనిధి'));
  }

  List<Widget> xererere = [];
  Future<dynamic> opOp() async {
    await http.get(Uri.parse('https://randomuser.me/api/')).then((value) {
      var x = jsonDecode(value.body);

      print(x['results'][0]['name']['first'] +
          ' ' +
          x['results'][0]['name']['last']);

      setState(() {
        xererere.add(Text(
          x['results'][0]['name']['first'] +
              ' ' +
              x['results'][0]['name']['last'],
          style: TextStyle(fontSize: 20, color: Colors.pink),
        ));

        xererere.add(Image.network(x['results'][0]['picture']['large']));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Container example"),
        ),
        body: Column(
          children: [
            Wrap(
              children: xererere,
            ),
            FloatingActionButton(onPressed: () {
              opOp();
            })
          ],
        ),
      ),
    );
  }
}
