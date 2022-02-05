import 'package:flutter/cupertino.dart';

class UserData{
    String? firstname,lastname,username,password,email;
    int? recordIndex;


    UserData({this.firstname,this.recordIndex,this.lastname,this.email,this.username,this.password});
}

List userData=[];



TextEditingController userController = TextEditingController();
TextEditingController firstnameController = TextEditingController();
TextEditingController lastnameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmpwdController = TextEditingController();



int index=-1;


