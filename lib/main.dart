import 'package:flutter/material.dart';
import 'package:profile_page_app/profile_fields.dart';
import 'package:profile_page_app/profile_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme(
          primary: Colors.white,
          primaryVariant: Colors.white,
          secondary: Color(0xFF567DF9),
          secondaryVariant: Color(0xFFc3cbd4),
          error: Colors.red,
          onBackground: Colors.white,
          onPrimary: Colors.white,
          onSecondary: Colors.white,
          onSurface: Colors.black,
          brightness: Brightness.dark,
          surface: Colors.white,
          onError: Colors.redAccent,
          background: Colors.transparent,
        ),
        primaryTextTheme: TextTheme(
          headline1: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          headline2: TextStyle(color: Color(0xFF567DF9), fontSize: 25, fontWeight: FontWeight.bold),
          headline3: TextStyle(color: Color(0xFFA8A8A8), fontSize: 13,),
          headline4: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold)
        ),
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: ProfileImage(),
            ),
            Expanded(
              flex: 4,
              child: ProfileFields(),
            )
          ],
        ),
      ),
    );
  }
}
