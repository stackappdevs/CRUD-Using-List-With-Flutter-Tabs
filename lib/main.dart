import 'package:flutter/material.dart';
import 'package:loginapp/pages/home/home_page.dart';


void main()
{

    WidgetsFlutterBinding.ensureInitialized();

    runApp(MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'app'
        ),
        routes: {
            '/' : (context) => HomePage(),
        },
    ));
}