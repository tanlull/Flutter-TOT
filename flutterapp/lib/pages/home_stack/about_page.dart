import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About us")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/building.png'),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'บมจ. ทีโอที',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    Divider(),
                    Text(
                        '89/2 ม. 3 ถ. แจ้งวัฒนะ ข. ทุ่งสองห้อง เขตหลักสี่ กทม. 10210'),
                    Divider(),
                    Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.wb_sunny, color: Colors.orange)
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text('สถาบันวิชาการ TOT'),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  '89/2 ม. 3 ถ. แจ้งวัฒนะ ข. ทุ่งสองห้อง \nเขตหลักสี่ กทม. 10210',
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(),
                    Wrap(
                      spacing: 8,
                      children: List.generate(
                          7,
                          (index) => Chip(
                                label: Text('${index + 1} บุคลากร'),
                                avatar: Icon(Icons.people_outline),
                                backgroundColor: Colors.orange[50],
                              )),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                            backgroundImage: AssetImage('assets/images/me.jpg'),
                            radius: 40),
                        CircleAvatar(
                            backgroundImage: AssetImage('assets/images/me.jpg'),
                            radius: 40),
                        CircleAvatar(
                            backgroundImage: AssetImage('assets/images/me.jpg'),
                            radius: 40),
                        SizedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Icon(Icons.alarm, color: Colors.orange),
                              Icon(Icons.star, color: Colors.orange),
                              Icon(Icons.lightbulb, color: Colors.orange),
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
