
import 'package:flutter/material.dart';
import 'package:loginapp/module/user_modle.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class UserList extends StatefulWidget {
  final TabController tabController;

  UserList({Key? key,required this.tabController}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {



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
              title: Text('${userData[i].firstName}'.toUpperCase(),style: TextStyle(fontWeight: FontWeight.bold,),),
              subtitle: Text('${userData[i].lastName}\n${userData[i].email}'),
              trailing: Container(
                padding: EdgeInsets.only(right: 0),
                width: width*0.28,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit,color: Colors.grey),
                        onPressed: () => updateUser(indexNo: i),
                    ),
                    IconButton(
                        icon: Icon(Icons.delete,color: Colors.grey),
                        onPressed: () => deleteUser(index: i),
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

  updateUser({required int indexNo}){

    index = indexNo;

    firstNameController.text = userData[indexNo].firstName;
    lastNameController.text =userData[indexNo].lastName;
    userNameController.text = userData[indexNo].userName;
    passwordController.text = userData[indexNo].password;
    emailController.text = userData[indexNo].email;
    confirmPasswordController.text=userData[indexNo].password;



    setState(() {});

    widget.tabController.animateTo(1);
  }

  deleteUser({required int index}){
    Alert(
        context: context,
        type: AlertType.warning,
        title: "Delete Record",
        content: Text('Are you sure to delete ${userData[index].firstName} ${userData[index].lastName}?',textAlign: TextAlign.center,style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
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
                userData.removeAt(index);
                Navigator.of(context).pop();
                firstNameController.clear();
                lastNameController.clear();
                userNameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
                index=-1;
              });
            },
          ),
        ]
    ).show();
  }
}