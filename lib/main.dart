import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofatgi_home_work/Screens/Register/cubit/cubit.dart';
import 'package:sofatgi_home_work/Screens/Welcome/Welcome%20screen.dart';

import 'Shared/Network/remote/dio_helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  Widget build(BuildContext context) {
    DioHelper();
    return MultiBlocProvider(
        providers: [
        BlocProvider(
        create: (context)=> RegisterCubit(),
    ),
    ],
    child: MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
      theme: ThemeData(
      primarySwatch: Colors.indigo,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      scaffoldBackgroundColor: Colors.grey[200],
      ),
    home: WelcomeScreen (),
    )
    ,
    );
  }
}