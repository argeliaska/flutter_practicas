import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'screens/Android/profile_screen.dart' as android;
import 'screens/iOS/profile_screen.dart' as ios;
import 'util/constants.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      isAndroid = true;
      isIOS = false;
      print("isAndroid");
    } else if (Platform.isIOS) {
      isIOS = true;
      isAndroid = false;
      print("isIOS");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      initialRoute: isAndroid ? android.ProfileScreen.id : ios.ProfileScreen.id,

      routes: {
        android.ProfileScreen.id: (context) => android.ProfileScreen(),
        ios.ProfileScreen.id: (context) => ios.ProfileScreen(),
      },
    );
  }

}


