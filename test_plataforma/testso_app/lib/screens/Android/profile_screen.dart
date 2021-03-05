import 'package:flutter/material.dart';
import '../../util/constants.dart';
import '../iOS/profile_screen.dart' as ios;

class ProfileScreen extends StatefulWidget {
  static const String id = 'android_profile_screen';

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String email;
  String password;
  TextEditingController emailController;
  TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Tu plataforma es ' + (isAndroid ? 'Android' : 'iOS')),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'Tu plataforma es ' + (isAndroid ? 'Android' : 'iOS'),
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: emailController,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'Correo electrónico',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              obscureText: true,
              textAlign: TextAlign.center,
              controller: passwordController,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                hintText: 'Contraseña',
              ),
            ),
            SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: ElevatedButton(
                onPressed: showResults,
                child: Text(
                  'Aceptar',
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: TextButton(
                  child: Text('Ver como iOS'),
                  style: TextButton.styleFrom(backgroundColor: Colors.white24),
                  onPressed: () {
                    Navigator.pushNamed(context, ios.ProfileScreen.id);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void showResults() async {
    String _email = emailController.text;
    String _password = passwordController.text;

    String message = 'Correo es $_email\n y tu contraseña $_password';
    var dialog = AlertDialog(
      title: Text('Datos introducidos\n'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.pop(context);
            })
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }
}
