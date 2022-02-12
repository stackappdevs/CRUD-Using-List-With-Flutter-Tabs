import 'package:flutter/material.dart';

class CommonTextButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? title;


  const CommonTextButton({
    Key? key,
    this.onPressed,this.title
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextButton(
      child: Text("$title",style: TextStyle(fontFamily: 'app'),),
      style: TextButton.styleFrom(
          primary: Colors.teal,
          textStyle: TextStyle(
              decoration: TextDecoration.underline,
              fontWeight: FontWeight.bold)),
      onPressed: onPressed,
    );
  }
}
