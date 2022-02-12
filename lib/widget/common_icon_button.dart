import 'package:flutter/material.dart';


class CommonIconButton extends StatelessWidget {

  final VoidCallback? onPressed;
  final bool isPwdHide;

  const CommonIconButton({
    Key? key,
    this.isPwdHide=false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        splashRadius: 1,
        onPressed: onPressed,
        icon: Icon(
          (isPwdHide)
              ? Icons.visibility
              : Icons.visibility_off,
          color: Colors.teal.shade200,
        ));
  }
}
