import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title = "hello world";
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  void initState() {
    super.initState();
    print('init state (home page)');
  }

  @override
  Widget build(BuildContext context) {
    print('build !!!');
    return Scaffold(
      drawer: Menu(),
      appBar: AppBar(
        title: Image.asset('assets/images/logo_tot.png'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.person_add, color: Colors.white, size: 35),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white, size: 35),
              onPressed: null),
        ],
        //leading: Image.asset('assets/images/me.jpg'),
        // leading: IconButton(
        //   icon: Icon(Icons.home, color: Colors.white, size: 35),
        //   onPressed: null,
        // )
      ),
      body: GridView.count(
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
                      style: TextStyle(fontSize: 20, color: Colors.blue))
                ],
              ),
              color: Colors.blue[100],
            ),
          ),
          OutlinedButton(
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.blue[100])),
            onPressed: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.map_rounded, size: 80, color: Colors.blue),
                Text('แผนที่',
                    style: TextStyle(fontSize: 20, color: Colors.blue))
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Sound of screams but the'),
            color: Colors.teal[300],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
