import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Avenir'
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f8f8),
      body: Stack(
        children: <Widget>[
          Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.43,
            width: MediaQuery.of(context).size.width,
            color: Color(0xfff5ceb8),
            child: Container(
              margin: EdgeInsets.only(right: 40, top: 20, bottom: 20),
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/path1.png'),
                  fit: BoxFit.contain
                ),
              ),
            ),
          )
        ],
       ),
          Column(
            children: <Widget>[
              SizedBox(height: 100,),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Good Morning \nViladelvia",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding:EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40))
                ),
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, size: 30,),
                    SizedBox(width: 20,),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  childAspectRatio: 0.85,
                  children: <Widget>[
                    categoryWidget('img1', "Diet Plan"),
                    categoryWidget('img2', "Exercises"),
                    categoryWidget('img3', "Medical Tips"),
                    categoryWidget('img4', "Yoga"),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      Text('Today'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                       Icon(Icons.settings, color: Colors.orange,),
                       Text('Settings', style: TextStyle(
                          color: Colors.orange,
                     ),)
                  ],
                ),
                  Column(
                    children: <Widget>[
                    Icon(Icons.calendar_today),
                    Text('Tomorrow'),
                   ],
                  ),
                ],
              ),
            )
          ],
        )
      ],
     ),
    );
  }

  Container categoryWidget(String img, String title) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, bottom: 20),
      width: MediaQuery.of(context).size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(30)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            spreadRadius: 1,
            offset: Offset(0, 10),
          )]
      ),
      child: InkWell(
        onTap: () {
          openProductPage('$img', '$title');
        },
        child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/$img.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              padding: EdgeInsets.all(20),
              child: Text('$title', style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
              ),textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  void openProductPage(String img, String title) {
    Navigator.pushNamed(context, '/productPage',
        arguments: {'image': '$img', 'title': '$title'});
  }
}
