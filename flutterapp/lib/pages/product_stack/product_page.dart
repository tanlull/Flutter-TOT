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
  bool isLoading = true;

  Future<void> getData() async {
    var url = 'https://api.codingthailand.com/api/course';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      //print(json.decode(response.body));
      final Product product = Product.fromJson(json.decode(response.body));
      //print(product.data.length);
      setState(() {
        isLoading = false;
        data = product.data;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      print('error!');
    }
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
      appBar: AppBar(title: Text('สินค้า')),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, 'productstack/detail',
                        arguments: {
                          'id': data[index].id,
                          'title': data[index].title
                        });
                  },
                  leading: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: NetworkImage(data[index].picture),
                            fit: BoxFit.cover)),
                  ),
                  title: Text('${data[index].title}'),
                  subtitle: Text('${data[index].detail}'),
                  trailing: Chip(
                      label: Text('${data[index].view}'),
                      backgroundColor: Colors.red[400]),
                );
              },
              separatorBuilder: (context, index) => Divider(),
              itemCount: data.length),
    );
  }
}
