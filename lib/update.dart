import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loginapp/module/data_modle.dart';

// ignore: must_be_immutable
class Update extends StatefulWidget {

  late final dynamic userDetail;
  late TabController tabController;
  Update({Key? key,required this.userDetail,required this.tabController}) : super(key: key);



  @override
  _UpdateState createState() => _UpdateState();
 }

class _UpdateState extends State<Update> {


  GlobalKey<FormState> secondform = GlobalKey();

  TextEditingController userController = TextEditingController();
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  String? username, password, firstname, lastname, email, confirmpwd;

  bool isPasswordHide = true;


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          SystemChannels.textInput.invokeMethod('TextInput.hide');
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
                          ),
                      initialValue: '${widget.userDetail.firstname}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (!RegExp('[a-zA-Z]').hasMatch(val!)) {
                          return 'Please enter character only';
                        }
                        if (val.length > 20) {
                          return 'Please enter short name';
                        }
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
                          ),
                      initialValue: '${widget.userDetail.lastname}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {

                        if (!RegExp('[a-zA-Z]').hasMatch(val!)) {
                          return 'Please enter character only';
                        }
                        if (val.length > 20) {
                          return 'Please enter short name';
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onSaved: (val) {
                        setState(() {
                          lastname = val;
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
                      ),
                      initialValue: '${widget.userDetail.username}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (val) {

                        if (val!.length > 20) {
                          return 'Please enter short name';
                        }
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      onSaved: (val) {
                        setState(() {
                          username = val;
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
                            Icons.mail,
                            color: Colors.teal,
                          ),
                      ),
                          initialValue: '${widget.userDetail.email}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      validator: (val) {
                        if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(val!)) {
                          return 'Please enter valid email address';
                        }
                      },
                      keyboardType: TextInputType.emailAddress,
                      onSaved: (val) {
                        setState(() {
                          email = val;
                        });
                      },
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    TextFormField(
                      cursorColor: Colors.teal,
                      initialValue: '${widget.userDetail.password}',
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
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.next,
                      obscureText: isPasswordHide,
                      validator: (val) {
                        confirmpwd = val;
                        if (val!.length < 6) {
                          return 'Please enter 6 digit long password';
                        }
                        if (val.length > 10) {
                          return 'Please enter less then 10 digit long password';
                        }
                      },
                      keyboardType: TextInputType.text,
                      onSaved: (val) {
                        setState(() {
                          password = val;
                        });
                      },
                      // controller: passwordController,
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
                      ),
                          initialValue: '${widget.userDetail.password}',
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textInputAction: TextInputAction.done,
                      validator: (val) {

                        if (val != confirmpwd) {
                          return 'Enter confirm password.';
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (secondform.currentState!.validate()) {
                          secondform.currentState!.save();

                               int i = widget.userDetail.recordIndex;

                               userData[i].firstname= firstname;
                               userData[i].lastname=lastname;
                               userData[i].username=username;
                               userData[i].email=email;
                               widget.tabController.animateTo(2,duration: Duration(seconds: 2),curve: Curves.easeInOut,);


                        }
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(fontSize: height * 0.025),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: StadiumBorder(),
                          primary: Colors.teal,
                          minimumSize: Size(width * 0.4, height * 0.06)),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
