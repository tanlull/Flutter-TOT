import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  Future<void> login(Map formValues) async {
    //formValues['name']
    //print(formValues);
    var url = 'https://api.codingthailand.com/api/login';
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          "email": formValues['email'],
          "password": formValues['password']
        }));
    if (response.statusCode == 200) {
      Map<String, dynamic> token = json.decode(response.body);
      //print(feedback['message']);
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('token', response.body);
      // get Profile
      var profileUrl = 'https://api.codingthailand.com/api/profile';
      var responseProfile = await http.get(profileUrl,
          headers: {'Authorization': 'Bearer ${token["access_token"]}'});

      Map<String, dynamic> profile = json.decode(responseProfile.body);
      var user = profile['data']['user'];

      await prefs.setString('profile', json.encode(user));
      print('profile user =$user');
      //กลับไปที่หน้า HomeStack

      Navigator.pushNamedAndRemoveUntil(
          context, '/homestack', (route) => false);

      // Future.delayed(Duration(seconds: 3), () {
      //     Navigator.pop(context);
      // });

    } else {
      Map<String, dynamic> err = json.decode(response.body);
      Flushbar(
        message: '${err['message']}',
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.red,
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.red,
      )..show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepPurple, Colors.lightBlue],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft)),
      child: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(40),
            child: Column(
              children: [
                FlutterLogo(size: 80),
                SizedBox(height: 40),
                FormBuilder(
                  key: _fbKey,
                  initialValue: {'email': '', 'password': ''},
                  autovalidateMode: AutovalidateMode
                      .always, //ถ้าไม่ใส่ต้อง submit ก่อนถึงจะตรวจสอบ validation
                  child: Column(
                    children: <Widget>[
                      FormBuilderTextField(
                        attribute: "email",
                        maxLines: 1,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle:
                                TextStyle(backgroundColor: Colors.white)),
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'ป้อนข้อมูลอีเมล์ด้วย'),
                          FormBuilderValidators.email(
                              errorText: 'รูปแบบอีเมล์ไม่ถูกต้อง'),
                        ],
                      ),
                      SizedBox(height: 20),
                      FormBuilderTextField(
                        attribute: "password",
                        maxLines: 1,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: 'Password',
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            errorStyle:
                                TextStyle(backgroundColor: Colors.white)),
                        validators: [
                          FormBuilderValidators.required(
                              errorText: 'ป้อนข้อมูลรหัสผ่านด้วย'),
                          FormBuilderValidators.minLength(3,
                              errorText: 'รหัสผ่านต้อง 3 ตัวอักษรขึ้นไป')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: ElevatedButton.icon(
                        label: Text('Log In'),
                        icon: Icon(Icons.login_rounded),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.orange,
                          //side: BorderSide(color: Colors.red, width: 5),
                          textStyle: TextStyle(
                            fontSize: 25,
                          ),
                          padding: EdgeInsets.all(15),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                        ),
                        onPressed: () {
                          if (_fbKey.currentState.saveAndValidate()) {
                            // print(_fbKey.currentState.value);
                            login(_fbKey.currentState.value);
                          }
                        },
                      ),
                    ),

                    // MaterialButton(
                    //   child: Text("Log In"),
                    //   onPressed: () {
                    //     if (_fbKey.currentState.saveAndValidate()) {
                    //       // print(_fbKey.currentState.value);
                    //       login(_fbKey.currentState.value);
                    //     }
                    //   },
                    // ),
                    // MaterialButton(
                    //     child: Text("สมัครสมาชิก"),
                    //     onPressed: () {
                    //       // _fbKey.currentState.reset();
                    //       Navigator.pushNamed(context, '/register');
                    //     },
                    //   ),
                    Expanded(
                      child: FlatButton(
                        child: Text("สมัครสมาชิก",
                            style: TextStyle(
                                decoration: TextDecoration.underline)),
                        textColor: Colors.white,
                        onPressed: () {
                          // _fbKey.currentState.reset();
                          Navigator.pushNamed(context, '/register');
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
