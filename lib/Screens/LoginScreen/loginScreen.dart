import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofatgi_home_work/Screens/ForgetPassowrd/Forget.dart';
import 'package:sofatgi_home_work/Screens/LoginScreen/Cubit/states.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';
import 'package:sofatgi_home_work/lay_out/home.dart';
import 'Cubit/Cubit.dart';


class LoginScreen extends StatelessWidget {
  String email ;
  String passowrd ;
  LoginScreen({this.email,this.passowrd});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  @override
  Widget build(BuildContext context)
  {
    if (email != null && passowrd != null)
      {
        emailController.text=email;
        passwordController.text=passowrd;
      }
    return BlocProvider (
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit,LoginStates>(
        listener: (context,state)
        {
          if(state is LoginStateSucess)
            {
              Navigator.pop(context);
              saveToken(state.token).then((value)
              {
                if (value)
              {
                showToast(text: 'sucess save talken', error: false);
                navigateaAndFinish(context, homeScreen());
              }
                    else
                      showToast(text: 'erroe while saving taken', error: false);
              });
            }

          if(state is LoginStateLoading)
            {
              buildProgress(
                context: context,
                text: 'please wait ...',
                error: false ,
              );
            }

          if (state is LoginStateError)
            {
              Navigator.pop(context);
              buildProgress(
                context: context,
                text: 'You don\'t have an account ',
                error: true ,
              );
            }
        },
        builder: (context,state)
        {
          return Scaffold(
              appBar: AppBar(
                title: Text('Login'),
                backgroundColor: defultColor,
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
                          isPassowrd: true,
                          controller: passwordController,
                          Type: TextInputType.visiblePassword,
                          hint: '*******',
                          title: 'Pass'),
                      SizedBox(
                        height: 40,
                      ),
                      difultButton(function: ()
                      {
                        String email = emailController.text;
                        String pass = passwordController.text;

                        if (email.isEmpty || pass.isEmpty)
                          {
                            showToast(text: 'please enter a valid data',
                                error: true) ;
                            return ;
                          }
                        LoginCubit.get(context).Login(
                          email: email ,
                          pass: pass,

                        ) ;

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
        },
      ),
    );
  }
}
