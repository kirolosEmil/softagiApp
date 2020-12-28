import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofatgi_home_work/Screens/LoginScreen/loginScreen.dart';
import 'package:sofatgi_home_work/Screens/Register/cubit/cubit.dart';
import 'package:sofatgi_home_work/Screens/Register/cubit/states.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';

class Register extends StatelessWidget {
  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterStates>(
      listener: (context, state) {
        if (state is RegisterStateLoading) {
          return buildProgress();
        }
        if (state is RegisterStateSucess) {
          return navigateTo(
            context,
            LoginScreen(),
          );
        }
        if (state is RegisterStateError) {
          Navigator.pop(context);
          return buildProgress(text: state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: (Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    headText(
                      'Sign up',
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defultTextForm(
                        controller: firstNameController,
                        Type: TextInputType.text,
                        hint: 'Kirillos',
                        title: 'First name'),
                    SizedBox(height: 10),
                    defultTextForm(
                        controller: lastNameController,
                        Type: TextInputType.text,
                        hint: 'last name',
                        title: 'Last name'),
                    SizedBox(height: 10),
                    defultTextForm(
                        controller: emailController,
                        Type: TextInputType.emailAddress,
                        hint: 'Kirillosemil@gyh.com',
                        title: 'Email'),
                    SizedBox(height: 10),
                    defultTextForm(
                        controller: passController,
                        Type: TextInputType.visiblePassword,
                        hint: '******',
                        title: 'Passowrd'),
                    SizedBox(height: 10),
                    defultTextForm(
                        controller: cityController,
                        Type: TextInputType.text,
                        hint: 'city',
                        title: 'city'),
                    SizedBox(height: 15),
                    difultButton(
                      function: () {
                        String firstName = firstNameController.text ;
                        String lastName = lastNameController.text ;
                        String email= emailController.text ;
                        String password = passController.text;
                        String city = cityController.text ;

                        RegisterCubit.get(context).register(
                          first: firstName,
                          last: lastName,
                          email: email,
                          pass: password,
                          city: city,
                        );
                      },
                      text: "Sign Up",
                    ),
                  ],
                ))),
          ),
        );
      },
    );
  }
}
