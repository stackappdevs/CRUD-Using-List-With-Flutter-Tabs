import 'package:flutter/material.dart';
import 'package:loginapp/constants/string_constants.dart';
import 'package:loginapp/module/user_modle.dart';
import 'package:loginapp/utills/validator.dart';
import 'package:loginapp/widget/common_elevated_button.dart';
import 'package:loginapp/widget/common_icon_button.dart';
import 'package:loginapp/widget/common_sizebox.dart';
import 'package:loginapp/widget/common_text_button.dart';
import 'package:loginapp/widget/common_textformfield.dart';


class SignIn extends StatefulWidget {

  final TabController tabController;

  SignIn({Key? key,required this.tabController}) : super(key: key);


  @override
  _SignInState createState() => _SignInState();
}



class _SignInState extends State<SignIn> {



  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Validation validation = Validation();

  String? userName,password;

  bool isPasswordHide = true;


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: width*0.055),
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [

                            SizedBox(height: height*0.2,),
                            userNameTextField(),
                            CommonSizeBox(),
                            passwordTextField(),

                            SizedBox(height: height*0.05,),
                            loginButton(),

                            SizedBox(height: height*0.1,),
                            Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(noAccount),
                                      CommonTextButton(
                                        title: signupButton,
                                        onPressed:(){
                                          setState(() {
                                            index=-1;
                                            widget.tabController.animateTo(1,duration: Duration(seconds: 2),curve: Curves.easeInOut);
                                          });
                                        },
                                      )
                                    ],
                                  ),
                          ],
                        )
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  userNameTextField(){
    return CommonTextFormField(
        labelText: enterUserName,
        controller: userNameController,
        prefixIcon: Icons.person,
        textInputAction: TextInputAction.next,
        keybordType: TextInputType.name,
        onSaved: (value){
          setState(() {
            userName = value;
          });
        },
        validator: (value){
            return validation.validateUserName(value);
        },
    );
  }

  passwordTextField(){
      return CommonTextFormField(
          labelText: enterPassword,
          controller: passwordController,
          keybordType: TextInputType.number,
          textInputAction: TextInputAction.done,
          prefixIcon: Icons.lock,
          suffix: CommonIconButton(
            isPwdHide: isPasswordHide,
            onPressed: () {
              setState(() {
                isPasswordHide = !isPasswordHide;
              });
            },),
          isObscureText: isPasswordHide,
          onSaved: (value){
            setState(() {
                password = value;
            });
          },
          validator: (value){
            return validation.validatePassword(value);
          },

      );
  }

  loginButton(){
      return CommonElevatedButton(
            child: 'Login',
            onPressed: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
                for(int i =0; i<userData.length;i++){
                  if(userName==userData[i].userName && password==userData[i].password){
                      showDialog(
                          context: context,
                          builder: (context){
                              return AlertDialog(
                                title: Text('Welcome ${userData[i].userName}'),
                                content: Container(
                                  height: 100,
                                  child: Column(
                                    children: [
                                         getRow("Name : ", '${userData[i].firstName} ${userData[i].lastName}'),
                                         getRow("Email : ", '${userData[i].email}'),
                                         getRow("Password :", '${userData[i].password}'),
                                    ],
                                  ),
                                ),
                                actions: [
                                    CommonTextButton(
                                      onPressed: (){
                                        Navigator.of(context).pop();

                                        userNameController.clear();
                                        passwordController.clear();
                                      },
                                      title: 'OK',
                                    )
                                ],
                              );
                          }
                      );
                  }
                  else{

                    if (userData[i].userName == userName &&
                        userData[i].password != password) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text(invalidPassword),
                        duration: Duration(seconds: 3),
                      ));

                      passwordController.clear();
                      break;
                    }
                    else{
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(
                        content: Text(invalidAccount),
                        duration: Duration(seconds: 3),
                      ));
                      widget.tabController.animateTo(1,duration: Duration(seconds: 2),curve: Curves.easeInOut);
                    }
                  }
                }

              }
            },
      );
  }


  Widget getRow(String name,String value){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(value,style: TextStyle(fontSize: 16),),
          ),
        ),
      ],
    );
  }


}
