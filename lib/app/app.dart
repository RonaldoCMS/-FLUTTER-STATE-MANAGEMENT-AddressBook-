import 'package:addressbook/app/model/contacts.dart';
import 'package:addressbook/app/pages/home_page.dart';
import 'package:addressbook/app/pages/info_page.dart';
import 'package:addressbook/app/pages/newcontact_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Contacts>(
      create: (context) => Contacts(),
      child: MaterialApp(
        title: 'Contacts',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(title: 'Contacts'),
        routes: {
          '/new-contact': (context) => const NewContactPage(),
        },
      ),
    );
  }
}
