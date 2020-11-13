import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_stack/home_stack.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/pages/product_stack/product_stack.dart';
import 'package:flutterapp/pages/register_page.dart';
import 'package:flutterapp/redux/app_reducer.dart';
import 'package:shared_preferences/shared_preferences.dart';

//redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

String token;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  token = prefs.getString('token');
  final store = Store<AppState>(appReducer, initialState: AppState.initial());

  runApp(MyApp(store: store));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;

  MyApp({this.store}); //this.store = myStore;

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
          title: 'Flutter ',
          theme: ThemeData(
              primarySwatch: Colors.green,
              primaryColor: Colors.blue,
              canvasColor:
                  Color(0xffe0f7fa), // https://material.io/resources/color
              accentColor: Colors.red,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              textTheme: TextTheme(
                  headline1: TextStyle(
                      fontSize: 40,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold))),
          debugShowCheckedModeBanner: false,
          //home: MyHomePage(title: 'Tanya Home Page'),
          initialRoute: '/',
          routes: {
            '/': (context) => token == null ? LoginPage() : HomeStack(),
            '/homestack': (context) => HomeStack(),
            '/productstack': (context) => ProductStack(),
            '/register': (context) => RegisterPage(),
            '/login': (context) => LoginPage(),
          }),
    );
  }
}
