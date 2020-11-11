import 'package:flutter/material.dart';
import 'package:flutterapp/models/product_model.dart';
import 'package:flutterapp/widgets/menu.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Data> data = [];

  Future<void> getData() async {
    var url = 'https://api.codingthailand.com/api/course';
    var response = await http.get(url);
    //print(json.decode(response.body));
    final Product product = Product.fromJson(json.decode(response.body));
    //print(product.data.length);
    setState(() {
      data = product.data;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(title: Text("Product Page")),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(title: Text('${data[index].title}'));
          },
          separatorBuilder: (context, index) => Divider(),
          itemCount: data.length),
    );
  }
}
