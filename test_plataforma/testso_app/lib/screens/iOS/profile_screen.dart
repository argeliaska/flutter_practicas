import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../util/constants.dart';
import '../Android/profile_screen.dart' as android;

class ProfileScreen extends StatefulWidget {
  static const String id = 'ios_profile_screen';

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
            CupertinoTextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              controller: emailController,
              placeholder: 'Correo electrónico',
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            CupertinoTextField(
              obscureText: true,
              textAlign: TextAlign.center,
              controller: passwordController,
              placeholder: 'Contraseña',
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 14.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: CupertinoButton(
                onPressed: showResults,
                child: Text(
                  'Aceptar',
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
              child: CupertinoButton(
                  child: Text('Ver como Android'),
                  onPressed: () {
                    Navigator.pushNamed(context, android.ProfileScreen.id);
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
    var dialog = CupertinoAlertDialog(
      title: Text('Datos introducidos\n'),
      content: Text(message),
      actions: <Widget>[
        CupertinoDialogAction(
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
