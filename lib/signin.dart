import 'package:flutter/material.dart';
import 'package:loginapp/module/data_modle.dart';


// ignore: must_be_immutable
class SignIn extends StatefulWidget {

  late TabController tabController;

  SignIn({Key? key,required this.tabController}) : super(key: key);


  @override
  _SignInState createState() => _SignInState();
}



class _SignInState extends State<SignIn> {



  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController user1Controller = TextEditingController();
  TextEditingController password1Controller = TextEditingController();
  String? username,password;

  bool isPasswordHide = true;


  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;


    return Scaffold(
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: width*0.055),
            child: Form(
                key: formkey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: height*0.2),
                      TextFormField(

                             cursorColor: Colors.teal,
                             decoration: InputDecoration(
                                 contentPadding: new EdgeInsets.symmetric(vertical: height*0.032),
                                 enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),),
                                  prefixIcon: Icon(Icons.person,color: Colors.teal,),
                                  labelText: 'User name',
                                  labelStyle: TextStyle(color: Colors.teal)
                             ),
                             textInputAction: TextInputAction.next,

                        validator: (val){
                                if(val==null || val.isEmpty){
                                    return 'Please enter user name';
                                }
                                return null;
                             },
                             keyboardType: TextInputType.name,
                             onSaved: (val){
                                setState(() {
                                  username = val;
                                });
                             },
                             controller: user1Controller,
                           ),
                            SizedBox(height: height*0.02,),
                            TextFormField(
                             cursorColor: Colors.teal,
                             decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),borderSide: BorderSide(color: Colors.teal,)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(height*0.2),),
                                  prefixIcon: Icon(Icons.lock,color: Colors.teal,),
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
                              textInputAction: TextInputAction.done,
                              validator: (val){
                                if(val==null || val.isEmpty){
                                    return 'Please enter password';
                                }
                                if(val.length<2){
                                  return 'Please enter 2 digit long password';
                                }
                                if(val.length>10){
                                  return 'Please enter less then 10 digit long password';
                                }
                                return null;
                             },
                             obscureText: isPasswordHide,
                             keyboardType: TextInputType.text,
                             onSaved: (val){
                                setState(() {
                                  password = val;
                                });
                             },
                             controller: password1Controller,
                           ),
                            SizedBox(height: height*0.05,),
                            ElevatedButton(
                                onPressed: (){
                                  if(formkey.currentState!.validate()){
                                    formkey.currentState!.save();
                                    for(int i =0; i<userData.length;i++){
                                      if(username==userData[i].username && password==userData[i].password){
                                        widget.tabController.animateTo(2,duration: Duration(seconds: 2),curve: Curves.easeInOut);


                                      }
                                      else{

                                        widget.tabController.animateTo(1,duration: Duration(seconds: 2),curve: Curves.easeInOut);

                                      }
                                    }

                                  }
                                },
                                child: Text('Login',style: TextStyle(fontSize: height*0.025),),
                                style: ElevatedButton.styleFrom(
                                  shape: StadiumBorder(),
                                  primary: Colors.teal,
                                  minimumSize: Size(width*0.4,height*0.06)
                                ),
                            ),
                            SizedBox(height: height*0.20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have Account?"),
                                TextButton(
                                  child: Text("Sign Up",style: TextStyle(fontFamily: 'app')),
                                  style: TextButton.styleFrom(
                                    primary: Colors.teal,
                                    textStyle: TextStyle(decoration: TextDecoration.underline,fontWeight: FontWeight.bold)
                                  ),
                                  onPressed: (){
                                      setState(() {
                                        index=-1;
                                        widget.tabController.animateTo(1,duration: Duration(seconds: 2),curve: Curves.easeInOut);
                                      });
                                    },
                                ),
                              ],
                            ),
                    ],
                  ),
                )
            ),
          ),
    );
  }
}
