import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key,this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(this.title,style: TextStyle(color:Colors.blue,fontSize: 50,backgroundColor:Colors.lime))
    );
  }
}