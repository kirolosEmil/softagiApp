import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sofatgi_home_work/Shared/Network/remote/dio_helper.dart';

SharedPreferences prefernces;
void initApp() {
  DioHelper();
}

Future<void> initPref() async
{
  prefernces = await SharedPreferences.getInstance();
}

Future<bool> saveToken(String token) => prefernces.setString('token', token);       // b save al kema ally haia al 'token'

String getToken() => prefernces.getString('token');                                 // btgeb al kema

Future<bool> removeToken() => prefernces.remove('token');                           // btms7 al kema

Widget difultButton({
  double radius = 18,
  @required Function function,
  @required String text,
  Color front = Colors.white,
}) =>
    Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: defultColor,
      ),
      child: FlatButton(
        onPressed: () {
          function();
        },
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: front,
          ),
        ),
      ),
    );

void buildProgress({context, text, bool error}) => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(mainAxisSize: MainAxisSize.min, children: [
          Column(
            children: [
              Row(children: [
                if (!error) CircularProgressIndicator(),
                if (!error)
                  SizedBox(
                    width: 20,
                  ),
                Expanded(child: Text(text)),
              ]),

              if (error)
                SizedBox(
                  height: 20,
                ),
              if (error)
                difultButton(
                    function: () {
                      Navigator.pop(context);
                    },
                    text: 'close'),
            ],
          ),
        ]),
      ),
    );

Widget headText(String text) => Text(
      text,
      style: TextStyle(fontSize: 23, color: Colors.black),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

void navigateaAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, MaterialPageRoute(builder: (context) => widget), (route) => false);

Widget Captions(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 16,
      ),
    );

Widget detailsText(String text) => Text(
      text,
      style: TextStyle(
        fontSize: 14,
      ),
    );

Widget defultTextForm({
  bool isPassowrd = false,
  String title,
  String hint = " ",
  @required TextEditingController controller,
  @required TextInputType Type,
}) =>
    Container(
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18), color: Colors.white),
      padding: EdgeInsetsDirectional.only(start: 8, end: 8, top: 8, bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null) detailsText(title),
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: TextFormField(
              obscureText: isPassowrd,
              controller: controller,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
              ),
              keyboardType: Type,
            ),
          )
        ],
      ),
    );

Widget logo() => Image(
      image: AssetImage('assets/images/sky-news-logo.png'),
    );

void showToast({@required text, @required error}) => Fluttertoast.showToast(
      msg: text.toString(),
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: error ? Colors.red : Colors.green,
      textColor: Colors.white,
      fontSize: 16,
    );

Color defultColor = Colors.red[900];

