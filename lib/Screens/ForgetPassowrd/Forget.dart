import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';

class forgetPassowrd extends StatelessWidget {
  var emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Passowrd'),
      ),
      body: SingleChildScrollView(
      child :Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 100,
            ),
            defultTextForm(
                controller: emailController,
                Type: TextInputType.emailAddress,
                hint: 'Type your email ',
                title: 'Email'),
            SizedBox(
              height: 200,
            ),
            difultButton(function: () {}, text: 'Send reset code'),
            SizedBox(
              height: 20,
            ),
            InkWell(
                onTap: (){
                  
                },
                child: Captions(' Login')),

          ],
        ),
      ),
      ),
    );
  }
}
