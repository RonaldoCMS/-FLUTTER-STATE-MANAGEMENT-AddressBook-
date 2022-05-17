import 'dart:collection';

import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:addressbook/app/pages/info_page.dart';
import 'package:addressbook/app/widget/contact_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Consumer<Contacts>(
        builder: (context, value, child) => ListView.builder(
          itemCount: value.contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(
                    contact: value.contacts[index],
                  ),
                ),
              ),
              child: Dismissible(
                key: ValueKey(value.contacts[index].id),
                onDismissed: (DismissDirection dismissDirection) {
                  value.remove(value.contacts[index]);
                },
                child: ListTile(
                  title: Text(value.contacts[index].name),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/new-contact'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
