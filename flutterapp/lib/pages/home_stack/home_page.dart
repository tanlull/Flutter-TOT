import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterapp/redux/app_reducer.dart';
import 'package:flutterapp/redux/profile/profile_action.dart';
import 'package:flutterapp/widgets/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Map<String, dynamic> profile;

  @override
  void initState() {
    super.initState();
    getProfile();
    //print('init state (home page)');
  }

  Future<void> getProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var newProfile = json.decode(prefs.getString('profile'));
    // Call redux action

    final store = StoreProvider.of<AppState>(context);
    store.dispatch(updateProfileAction(newProfile));
    // setState(() {
    //   profile = json.decode(prefs.getString('profile'));
    // });
  }

  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    await prefs.remove('profile');
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil('/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    var isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    //print('build !!!');
    return Scaffold(
        drawer: Menu(),
        appBar: AppBar(
          title: Image.asset('assets/images/logo_tot.png'),
          centerTitle: true,
          actions: [
            // IconButton(
            //     icon: Icon(Icons.person_add, color: Colors.white, size: 35),
            //     onPressed: null),
            IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
              onPressed: () {
                logout();
              },
            )
          ],
          //leading: Image.asset('assets/images/me.jpg'),
          // leading: IconButton(
          //   icon: Icon(Icons.home, color: Colors.white, size: 35),
          //   onPressed: null,
          // )
        ),
        body: Column(
          children: [
            Expanded(
                flex: isPortrait ? 1 : 3,
                child: Center(
                    child: StoreConnector<AppState, Map<String, dynamic>>(
                        distinct: true,
                        converter: (store) => store.state.profileState.profile,
                        builder: (context, profile) {
                          return Column(
                            children: [
                              Text('Hello Khun : ${profile['name']}'),
                              Text(
                                  'email  : ${profile['email']} Role : ${profile['role']}')
                            ],
                          );
                        }))),
            Expanded(
              flex: isPortrait ? 8 : 9,
              child: GridView.count(
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'homestack/about');
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, size: 80, color: Colors.blue),
                          Text('เกี่ยวกับ',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue))
                        ],
                      ),
                      color: Colors.blue[100],
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.blue[100])),
                    onPressed: () {
                      Navigator.pushNamed(context, 'homestack/map');
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map_rounded, size: 80, color: Colors.blue),
                        Text('แผนที่',
                            style: TextStyle(fontSize: 20, color: Colors.blue))
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
