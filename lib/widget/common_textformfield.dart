import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextFormField extends StatelessWidget {


  final TextEditingController? controller;
  final String? labelText;
  final FormFieldValidator<String>? validator;
  final  GestureTapCallback? onTap;
  final Widget? icon;
  final TextInputType? keybordType;
  final bool isObscureText;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final IconData? prefixIcon;


  CommonTextFormField({
    Key? key,
    this.controller,
    this.labelText,
    this.icon,
    this.inputFormatters,
    this.isObscureText=false,
    this.onSaved,
    this.onTap,
    this.suffix,
    this.keybordType,
    this.textInputAction,
    this.validator,
    this.prefixIcon
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return  TextFormField(
      cursorColor: Colors.teal,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),),
        prefixIcon: Icon(prefixIcon,color: Colors.teal,),
        labelText:  labelText,
        labelStyle: TextStyle(color: Colors.teal),
        suffixIcon: suffix,
      ),
      validator: validator,
      onSaved: onSaved,
      onTap: onTap,
      obscureText: isObscureText,
      controller: controller,
      inputFormatters: inputFormatters,
      keyboardType: keybordType,
      textInputAction: textInputAction,
    );
  }
}

