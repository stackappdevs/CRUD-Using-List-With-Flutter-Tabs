import 'package:flutter/cupertino.dart';

class UserData{
    String? firstName,lastName,userName,password,email;
    int? recordIndex;


    UserData({this.firstName,this.recordIndex,this.lastName,this.email,this.userName,this.password});
}

List userData=[];



TextEditingController userNameController = TextEditingController();
TextEditingController firstNameController = TextEditingController();
TextEditingController lastNameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController confirmPasswordController = TextEditingController();



int index=-1;


