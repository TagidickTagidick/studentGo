import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final IconData prefixIconData;
  final IconData suffixIconData;
  final bool obscureText;
  final Function onChanged;

  TextFieldWidget({
    this.hintText,
    this.prefixIconData,
    this.suffixIconData,
    this.obscureText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    //final model = Provider.of<HomeModel>(context);

    return TextField(
      onChanged: onChanged,
      obscureText: obscureText,
      cursorColor: Color(0xff0a2896),
      style: TextStyle(
        color: Color(0xff0a2896),
        fontSize: 14.0,
      ),
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Color(0xff0a2896)),
        focusColor: Color(0xff0a2896),
        filled: true,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Color(0xff0a2896)),
        ),
        labelText: hintText,
        prefixIcon: Icon(
          prefixIconData,
          size: 18,
          color: Color(0xff0a2896)
        ),
        suffixIcon: GestureDetector(
          // onTap: () {
          //   model.isVisible = !model.isVisible;
          // },
          child: Icon(
            suffixIconData,
            size: 18,
            color: Color(0xff0a2896)
          ),
        ),
      ),
    );
  }
}