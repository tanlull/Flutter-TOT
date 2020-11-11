import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/me.jpg'),
            ),
            accountEmail: Text('tanyas@tot.co.th'),
            accountName: Text('Tanya Sattayaaphitan'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            subtitle: Text('home'),
            trailing: Icon(Icons.arrow_right),
            selected: ModalRoute.of(context).settings.name == 'homestack/home'
                ? true
                : false,
            onTap: () {
              // Clear all page and goto main
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.golf_course),
            title: Text('สินค้า'),
            subtitle: Text('รายละเอียดสินค้า'),
            trailing: Icon(Icons.arrow_right),
            selected:
                ModalRoute.of(context).settings.name == 'productstack/product'
                    ? true
                    : false,
            onTap: () {
              // Clear all page and goto main
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          ),
        ],
      ),
    );
  }
}
