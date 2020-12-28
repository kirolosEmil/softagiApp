import 'package:flutter/material.dart';
import 'package:sofatgi_home_work/Screens/LoginScreen/loginScreen.dart';
import 'package:sofatgi_home_work/Screens/Register/Register.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            logo(),
            SizedBox(
              height: 70,
            ),
            difultButton(
              background: Colors.red[900],
                text: 'login',
                function: () {
                  navigateTo(context, LoginScreen());
                }),
            SizedBox(
              height: 20,
            ),
            difultButton(
                text: 'Register',
                function: () {
                navigateTo(context, Register());
                }),
            SizedBox(
              height: 20,
            ),
            Captions('Or Login With'),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundColor: backcolor(),
                  child: Image(
                    image: AssetImage('assets/images/facebook.png'),
                    height: 24,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  radius: 20,
                  backgroundColor: backcolor(),
                  child: Image(
                    image: AssetImage('assets/images/google-glass-logo.png'),
                    height: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
