import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';


///////////  Start  defualt Form Field Widget /////////////
Widget defualtFormField({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType type,
  required String hintText,
  required IconData prefix,
  IconData? suffix,
  bool isPassword = false,
  VoidCallback? suffixPressed,
  double padding = 15.0,
  double borderRadius = 25.0,
  void Function()? onTap,
  ValueChanged<String>? onChanged,
  String? Function(String?)? onSubmitted,
}) =>
    Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: TextFormField(
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),

        obscureText: isPassword,
        validator: validate,
        onTap: onTap,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          prefixIcon: Icon(prefix),
          suffixIcon: IconButton(icon: Icon(suffix), onPressed: suffixPressed),
          hintText: hintText,
        ),
      ),
    );
///////////  End  defualt Form Field Widget /////////////

Widget defualtButton(
    {
      required BuildContext context,
      required String name,
      Color? color ,
      required VoidCallback onPressed
    }
    )=>Padding(
  padding: const EdgeInsets.symmetric(horizontal: 25),
  child: Container(
      height: 67,
      width: 353,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        color: HexColor('53B175'),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child:  Text(
          name,
          style: TextStyle(
              color: color,
              fontSize: 18.0,
              fontWeight: FontWeight.w600
          ),
        ),
      )),
);
///////// Start Show Toast Method /////////////////////
void showToast({String? text, required ToastStates state
  // required toastStates state
}) =>
    Fluttertoast.showToast(
        msg: text!,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: choseToastColor(state),
        textColor: Colors.white,
        fontSize: 16.0);
///////// Start Enum Toast States /////////////////////
enum ToastStates { success, error, warning }
// ignore: body_might_complete_normally_nullable
///////// Start choseToastColor Switch /////////////////////
Color? choseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.amber;
  }
  return color;
}

///////////  Start navigate And Finish Method /////////////
void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) => widget),
        (route) =>
    false); //////////////////=> return false or true <==////////////////
///////////  End navigate And Finish Method /////////////
///////////  Start  default Text Button Widget /////////////
Widget defaultTextButton(
    {required VoidCallback onPressed, required String text}) =>
    TextButton(onPressed: onPressed, child: Text(text.toUpperCase()));
///////////  End  default Text Button Widget /////////////