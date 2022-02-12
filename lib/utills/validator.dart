

import 'package:loginapp/constants/string_constants.dart';

class Validation{

  validateNameField(String? value,String? fieldName){
    if (value == null || value.isEmpty) {
      return  fieldName;
    }
    if (!RegExp('[a-zA-Z]').hasMatch(value)) {
      return errorNameCharacter;
    }
    if (value.length > 20) {
      return errorNameLength;
    }
    return null;
  }


  validateUserName(String? value){
    if(value==null || value.isEmpty){
      return errorUserName;
    }
    if (value.length > 20) {
      return errorNameLength;
    }
    return null;
  }

  validateEmail(String? value){

    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    if (value!.isEmpty) {
      return errorEmail;
    } else if (!RegExp(pattern).hasMatch(value)) {
      return invalidEmail;
    }
    return null;
  }

  validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return errorPassword;
    } else if (value.length < 6) {
      return errorPasswordLength;
    }
    return null;
  }


  validateConfirmPassword(String? value,String? confirmPassword){
    if (value!.isEmpty) {
      return enterConfirmPassword;
    }
    if (value != confirmPassword) {
      return errorPasswordMatch;
    }
    return null;
  }



}
