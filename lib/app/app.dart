import 'package:addressbook/app/pages/home_page.dart';
import 'package:addressbook/app/pages/newcontact_page.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contacts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(title: 'Contacts'),
      routes: {'/new-contact': (context) => const NewContactPage()},
    );
  }
}
