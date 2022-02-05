
import 'package:flutter/material.dart';
import 'package:loginapp/module/data_modle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

// ignore: must_be_immutable
class UserList extends StatefulWidget {
  late TabController tabController;

  UserList({Key? key,required this.tabController}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;



    return Scaffold(
      body: ListView.separated(
        itemCount: userData.length,
        padding: EdgeInsets.all(height*0.015),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context,i){
          return SizedBox(height: height*0.012,);
        },
        itemBuilder: (context,i){
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(height*0.01)) ,
            color: Colors.teal.shade50,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
              leading: Container(
                  width: width*0.13,
                  alignment: Alignment.center,
                  child: Text("${i+1}",style: TextStyle(fontWeight: FontWeight.bold))
              ),
              title: Text('${userData[i].firstname}'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('${userData[i].lastname}\n${userData[i].email}'),
              trailing: Container(
                padding: EdgeInsets.only(right: 0),
                width: width*0.28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit,color: Colors.grey),
                        onPressed: (){


                            index=i;

                            firstnameController.text = userData[i].firstname;
                            lastnameController.text =userData[i].lastname;
                            userController.text = userData[i].username;
                            passwordController.text = userData[i].password;
                            emailController.text = userData[i].email;
                            confirmpwdController.text=userData[i].password;



                            setState(() {});

                            widget.tabController.animateTo(1);
                        }),
                    IconButton(
                        icon: Icon(Icons.delete,color: Colors.grey),
                        onPressed: (){
                          Alert(
                              context: context,
                              type: AlertType.warning,
                              title: "Delete Record",
                              content: Text('Are you sure to delete ${userData[i].firstname} ${userData[i].lastname}?',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                              buttons: [
                                DialogButton(
                                  child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),
                                  onPressed: () => Navigator.pop(context),
                                  color: Colors.teal.shade100,
                                ),
                                DialogButton(
                                  child: Text('Delete',style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),),
                                  color: Colors.teal.shade100,
                                  onPressed: () {
                                    setState(() {
                                      userData.removeAt(i);
                                      Navigator.of(context).pop();
                                      firstnameController.clear();
                                      lastnameController.clear();
                                      userController.clear();
                                      emailController.clear();
                                      passwordController.clear();
                                      confirmpwdController.clear();
                                      index=-1;
                                    });
                                  },
                                ),
                              ]
                          ).show();
                        }
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}