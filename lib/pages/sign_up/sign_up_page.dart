import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/constants/string_constants.dart';
import 'package:loginapp/module/user_modle.dart';
import 'package:loginapp/utills/validator.dart';
import 'package:loginapp/widget/common_elevated_button.dart';
import 'package:loginapp/widget/common_icon_button.dart';
import 'package:loginapp/widget/common_sizebox.dart';
import 'package:loginapp/widget/common_text_button.dart';
import 'package:loginapp/widget/common_textformfield.dart';

class SignUp extends StatefulWidget {

  final TabController tabController;

  SignUp({Key? key,required this.tabController}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  GlobalKey<FormState> secondForm = GlobalKey();
  Validation validation = Validation();


  String? userName, password, firstName, lastName, email, confirmPassword;

  bool isPasswordHide = true;
  bool isConfirmPasswordHide = true;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;




    return Scaffold(
      body: GestureDetector(
        onTap: (){
            SystemChannels.textInput.invokeMethod('TextInput.hide');
            FocusScope.of(context).unfocus();
        },
        behavior: HitTestBehavior.opaque,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: width * 0.055,vertical: height*0.02).copyWith(bottom: 0),
                  child: Form(
                      key: secondForm,
                      child: Column(
                        children: [

                          firstNameTextField(),
                          CommonSizeBox(),
                          lastNameTextField(),
                          CommonSizeBox(),
                          userNameTextField(),
                          CommonSizeBox(),
                          emailTextField(),
                          CommonSizeBox(),
                          passwordTextField(),
                          CommonSizeBox(),
                          confirmPasswordField(),
                          CommonSizeBox(),

                          signUpButton(),
                          CommonSizeBox(),
                          (index<0) ?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(alreadyAccount),
                              CommonTextButton(
                                title: loginButton,
                                onPressed: () {
                                  widget.tabController.animateTo(0,duration: Duration(seconds: 2),curve: Curves.easeInOut);
                                },
                              )
                            ],
                          ):Container()
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  firstNameTextField(){
      return CommonTextFormField(
        labelText: enterFirstName,
        controller: firstNameController,
        prefixIcon: Icons.person,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.name,
        onSaved: (val) {
          setState(() {
            firstName = val;
          });
        },
        validator:(value){
            return  validation.validateNameField(value, errorFirstName);
        } ,
      );
  }

  lastNameTextField(){
      return CommonTextFormField(
        labelText: enterLastName,
        controller: lastNameController,
        prefixIcon: Icons.person,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.name,
        onSaved: (val) {
          setState(() {
            lastName = val;
          });
        },
        validator:(value){
            return  validation.validateNameField(value, errorLastName);
        } ,
      );
  }

  userNameTextField(){
      return CommonTextFormField(
        labelText: enterUserName,
        controller: userNameController,
        prefixIcon: Icons.person,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.name,
        onSaved: (val) {
          setState(() {
            userName = val;
          });
        },
        validator:(value){
            return  validation.validateUserName(value);
        } ,
      );
  }

  emailTextField(){
      return CommonTextFormField(
        labelText: enterEmail,
        controller: emailController,
        prefixIcon: Icons.email,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.emailAddress,
        inputFormatters: [
          FilteringTextInputFormatter.deny(RegExp('[ ]')),
        ],
        onSaved: (val) {
          setState(() {
            email = val;
          });
        },
        validator:(value){
            return  validation.validateEmail(value);
        } ,
      );
  }

  passwordTextField(){
      return CommonTextFormField(
        labelText: enterPassword,
        controller: passwordController,
        prefixIcon: Icons.lock_outline,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.number,
        isObscureText: isPasswordHide,
        suffix: CommonIconButton(
          isPwdHide: isPasswordHide,
          onPressed: () {
            setState(() {
              isPasswordHide = !isPasswordHide;
            });
          },),
        onSaved: (val) {
          setState(() {
            password = val;
          });
        },
        validator:(value){
            return  validation.validatePassword(value);
        } ,
      );
  }

  confirmPasswordField(){
      return CommonTextFormField(
        labelText: enterPassword,
        controller: confirmPasswordController,
        prefixIcon: Icons.lock,
        textInputAction: TextInputAction.done,
        keybordType: TextInputType.number,
        isObscureText: isConfirmPasswordHide,
        suffix: CommonIconButton(
          isPwdHide: isConfirmPasswordHide,
          onPressed: () {
            setState(() {
              isConfirmPasswordHide = !isConfirmPasswordHide;
            });
          },),
        onSaved: (val) {
          setState(() {
            confirmPassword = val;
          });
        },
        validator:(value){
            return  validation.validateConfirmPassword(value, passwordController.text);
        } ,
      );
  }

  signUpButton(){
    return CommonElevatedButton(
        child: (index>-1) ? updateButton : signupButton,
        onPressed: (){
          if (secondForm.currentState!.validate()) {
            secondForm.currentState!.save();

            if(index>-1){


              userData[index].firstName= firstName;
              userData[index].lastName=lastName;
              userData[index].userName=userName;
              userData[index].email=email;

              index=-1;
              widget.tabController.animateTo(2);

            }
            else{
              userData.insert(0, UserData(
                  firstName: firstName,
                  lastName: lastName,
                  email: email,
                  userName: userName,
                  password: password));

              widget.tabController.animateTo(2);


            }
          }

          firstNameController.clear();
          lastNameController.clear();
          userNameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          setState(() {});
          FocusScope.of(context).unfocus();
        },
    );
  }

}
