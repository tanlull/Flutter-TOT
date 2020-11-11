import 'package:flutter/material.dart';

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
          leading: IconButton(
            icon: Icon(Icons.home, color: Colors.white, size: 35),
            onPressed: null,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello, '),
                Text('Flutter'),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, 'homestack/about');
                },
                child: Text('เกี่ยวกับเรา')),
            Text(
              "ธัญญา 123 $title",
              style: Theme.of(context).textTheme.headline1,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    title = 'TOT.co.th';
                  });
                },
                child: Text('กดดิ!')),
            Text(
              'Hello World from Tsnys',
            ),
            Text(
              'คุณกดไปแล้วจำนวน:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _decrementCounter();
                  });
                },
                child: Text('ลบ Counter!')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
