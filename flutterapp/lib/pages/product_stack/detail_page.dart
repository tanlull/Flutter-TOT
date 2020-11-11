import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/menu.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(title: Text("Detail Page")),
      body: Text('รายละเอียดสินค้า'),
    );
  }
}
