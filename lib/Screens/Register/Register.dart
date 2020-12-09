import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    ),
      body:SingleChildScrollView(
      child : Padding(
        padding: const EdgeInsets.all(25.0),
        child: (
          Column(
    crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                  headText(
                   'Sign up',
                 ),
                SizedBox(
                  height: 20,
                ),
                defultTextForm(
                    controller: FirstNameController,
                    Type: TextInputType.text,
                    hint: 'Kirillos',
                    title: 'First name'),
                SizedBox(height:10) ,
                defultTextForm(
                    controller: SecoundName,
                    Type: TextInputType.text,
                    hint: 'Emil',
                    title: 'First name'),
              SizedBox(height: 10) ,
                defultTextForm(
                    controller: emailController,
                    Type: TextInputType.emailAddress,
                    hint: 'Kirillosemil@gyh.com',
                    title: 'Email'),
              SizedBox(height: 10) ,
              defultTextForm(
                  controller: PassowrdController,
                  Type: TextInputType.visiblePassword,
                  hint: '******',
                  title: 'Passowrd'),
              SizedBox(height: 25) ,
              difultButton(function: (){
              }, text: "Sign Up"),
              ],
          )
        )
        ),
      ),
    );
  }
  }