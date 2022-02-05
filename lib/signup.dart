import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/module/data_modle.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {

  late TabController tabController;

  SignUp({Key? key,required this.tabController}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  GlobalKey<FormState> secondform = GlobalKey();



  String? username, password, firstname, lastname, email, confirmpwd;

  bool isPasswordHide = true;
  bool isPasswordHide2 = true;


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
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: width * 0.055),
          child: Form(
              key: secondform,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          labelText: 'First name',
                          labelStyle: TextStyle(color: Colors.teal)
                        ),
                      controller: firstnameController,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter First name';
                        }
                        if (!RegExp('[a-zA-Z]').hasMatch(val)) {
                          return 'Please enter character only';
                        }
                        if (val.length > 20) {
                          return 'Please enter short name';
                        }
                        return null;
                      },
                      onSaved: (val) {
                        setState(() {
                          firstname = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          labelText: 'Last name',
                          labelStyle: TextStyle(color: Colors.teal)),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter Last name';
                        }
                        if (!RegExp('[a-zA-Z]').hasMatch(val)) {
                          return 'Please enter character only';
                        }
                        if (val.length > 20) {
                          return 'Please enter short name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onSaved: (val) {
                        setState(() {
                          lastname = val;
                        });
                      },
                      controller: lastnameController,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.teal,
                          ),
                          labelText: 'User name',
                          labelStyle: TextStyle(color: Colors.teal)),
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter User name';
                        }
                        if (val.length > 20) {
                          return 'Please enter short name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onSaved: (val) {
                        setState(() {
                          username = val;
                        });
                      },
                      controller: userController,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                          ),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.teal,
                          ),
                          labelText: 'Email',
                          labelStyle: TextStyle(color: Colors.teal)),
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val)) {
                          return 'Please enter valid email address';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                      controller: emailController,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                            borderSide: BorderSide(
                              color: Colors.teal,
                            )),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(height * 0.2),
                        ),
                        prefixIcon: Icon(
                          Icons.lock_outline,
                          color: Colors.teal,
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.teal),
                        suffixIcon: IconButton(
                          icon: Icon((isPasswordHide) ? Icons.visibility_off : Icons.remove_red_eye_sharp),
                          color: Colors.teal,
                          onPressed: () {
                            setState(() {
                              isPasswordHide = !isPasswordHide;
                            });
                          },
                        ),
                      ),
                      obscureText: isPasswordHide,
                      validator: (val) {
                        confirmpwd = val;
                        if (val == null || val.isEmpty) {
                          return 'Please enter password';
                        }
                        if (val.length < 2) {
                          return 'Please enter 2 digit long password';
                        }
                        if (val.length > 10) {
                          return 'Please enter less then 10 digit long password';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      controller: passwordController,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(height * 0.2),
                              borderSide: BorderSide(
                                color: Colors.teal,
                              )),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(height * 0.2),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.teal,
                          ),
                          suffixIcon: IconButton(
                            icon: Icon((isPasswordHide2) ? Icons.visibility_off : Icons.remove_red_eye_sharp),
                            color: Colors.teal,
                            onPressed: () {
                              setState(() {
                                isPasswordHide2 = !isPasswordHide2;
                              });
                            },
                          ),
                          labelText: 'Confirm Password',
                          labelStyle: TextStyle(color: Colors.teal)),
                      textInputAction: TextInputAction.done,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return 'Please Re-enter  password';
                        }
                        if (val != confirmpwd) {
                          return 'Enter confirm password.';
                        }
                        return null;
                      },
                      obscureText: isPasswordHide2,
                      keyboardType: TextInputType.text,
                      controller:confirmpwdController,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (secondform.currentState!.validate()) {
                          secondform.currentState!.save();

                          if(index>-1){


                           userData[index].firstname= firstname;
                           userData[index].lastname=lastname;
                           userData[index].username=username;
                           userData[index].email=email;


                           firstnameController.clear();
                           lastnameController.clear();
                           userController.clear();
                           emailController.clear();
                           passwordController.clear();
                           confirmpwdController.clear();
                           index=-1;

                           setState(() {});

                           widget.tabController.animateTo(2);


                          }
                          else{
                              userData.add(UserData(
                                  firstname: firstname,
                                  lastname: lastname,
                                  email: email,
                                  username: username,
                                  password: password));

                              firstnameController.clear();
                              lastnameController.clear();
                              userController.clear();
                              emailController.clear();
                              passwordController.clear();
                              confirmpwdController.clear();
                              setState(() {});

                              widget.tabController.animateTo(2);


                          }
                        }
                        FocusScope.of(context).unfocus();
                      },
                      child: (index>-1) ? Text('Update', style: TextStyle(fontSize: height * 0.025)) : Text('Sign up', style: TextStyle(fontSize: height * 0.025),),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.teal,
                          minimumSize: Size(width * 0.4, height * 0.06)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    (index<0) ?
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have Account?"),
                        TextButton(
                          child: Text("Login",style: TextStyle(fontFamily: 'app'),),
                          style: TextButton.styleFrom(
                              primary: Colors.teal,
                              textStyle: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold)),
                          onPressed: () {
                            widget.tabController.animateTo(0,duration: Duration(seconds: 2),curve: Curves.easeInOut);
                          },
                        ),
                      ],
                    ):Container()
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
