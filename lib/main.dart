import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sofatgi_home_work/Screens/Register/cubit/cubit.dart';
import 'package:sofatgi_home_work/Screens/Welcome/Welcome%20screen.dart';
import 'package:sofatgi_home_work/Shared/Componetnts/Compo.dart';
import 'package:sofatgi_home_work/lay_out/cubit/cubit.dart';
import 'package:sofatgi_home_work/lay_out/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var widget;

  await initPref().then(
     (value)
    {
      if (getToken() != null && getToken().length > 0)
        widget = homeScreen();
      else
        widget = WelcomeScreen();
    },
  );

  runApp(MyApp(widget));
}


class MyApp extends StatelessWidget {

  var Finalwidget;

  MyApp(this.Finalwidget);                                                        //cunstructor

  Widget build(BuildContext context) {
    initApp();

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => homeCubit(),
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
        home: Finalwidget,
      ),
    );
  }
}
