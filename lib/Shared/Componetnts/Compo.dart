import 'package:flutter/material.dart';
var emailController = TextEditingController();
var PassowrdController = TextEditingController();
var FirstNameController = TextEditingController();
var SecoundName  = TextEditingController();

Widget difultButton({
  Color background = Colors.red   ,
  double radius = 18 ,
  @required Function function ,
  @required String text ,
  Color front = Colors.white ,
}) =>Container(
  width: double.infinity,
  height: 50,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: Colors.red[900],

  ),
  child: FlatButton(
    onPressed: (){
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

Widget headText ( String text )=> Text (text,
                      style: TextStyle (
                        fontSize: 23,
                        color: Colors.black ),);


Widget Captions (String text) => Text (
  text ,
  style: TextStyle (
    fontSize: 16 ,
  ),
) ;


Widget detailsText (String text) => Text (
  text ,
  style: TextStyle (
    fontSize: 14 ,
  ),
) ;

Widget defultTextForm ({
  String title ,
  String hint = " " ,
  @required TextEditingController controller ,
 @required TextInputType Type ,
}) =>  Container(
  width: double.infinity,
  height: 74,
  decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(18),
      color: Colors.white
  ),
  padding : EdgeInsetsDirectional.only(
    start: 8 ,
    end: 8,
    top: 8 ,
    bottom: 1
  ),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != null)
      detailsText(title),
      Padding(
        padding: const EdgeInsets.only(top: 1),
        child: TextFormField(
          controller:controller ,
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

Widget logo () =>  Image (
image: AssetImage('assets/images/sky.png'),
);

Color backcolor () => Colors.indigo ;