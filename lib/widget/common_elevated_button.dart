import 'package:flutter/material.dart';


class CommonElevatedButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final String? child;

      CommonElevatedButton({
        Key? key,
        this.child,
        this.onPressed
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return ElevatedButton(
      onPressed: onPressed,
      child:  Text('$child',style: TextStyle(fontSize: height*0.025),),
      style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          primary: Colors.teal,
          minimumSize: Size(width*0.4,height*0.06)
      ),
    );
  }
}
