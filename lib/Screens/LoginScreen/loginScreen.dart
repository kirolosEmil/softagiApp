import 'package:flutter/material.dart';
import 'file:///E:/Softagi/new_softagi/lib/Screens/ForgetPassowrd/Forget.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';

class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                logo(),
                SizedBox(
                  height: 30,
                ),
                defultTextForm(
                    controller: emailController,
                    Type: TextInputType.emailAddress,
                    hint: 'Type your email ',
                    title: 'Email'),
                SizedBox(
                  height: 20,
                ),
                defultTextForm(
                    controller: passwordController,
                    Type: TextInputType.visiblePassword,
                    hint: '*******',
                    title: 'Pass'),
                SizedBox(
                  height: 40,
                ),
                difultButton(function: () {

                }, text: 'Login'),
                SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forgetPassowrd(),
                      ),
                    );
                  },
                  child: Captions('Forget Passowrd ?'),
                )
              ],
            ),
          ),
        ));
  }
}
