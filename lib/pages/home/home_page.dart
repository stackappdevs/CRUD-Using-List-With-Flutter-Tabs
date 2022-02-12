import 'package:flutter/material.dart';
import 'package:loginapp/pages/login/login_page.dart';
import 'package:loginapp/pages/sign_up/sign_up_page.dart';

import 'package:loginapp/pages/user_list/userlist_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {});
    return Scaffold(
      appBar: AppBar(
        title: Text('User Detail'),
        leading: Icon(Icons.menu),
        backgroundColor: Colors.teal.shade600,
        bottom: TabBar(
            indicatorColor: Colors.white,
            controller: tabController,
            tabs: [
              Tab(
                  child: Text(
                'Login',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              Tab(
                  child: Text(
                'Sign up',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
              Tab(
                  child: Text(
                'User List',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
            ]),
      ),
      body: TabBarView(controller: tabController, children: [
        SignIn(tabController: tabController),
        SignUp(tabController: tabController),
        UserList(tabController: tabController,),
      ]),
    );
  }
}
