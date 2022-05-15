import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Contacts contactBook = Contacts();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ValueListenableBuilder(
            valueListenable: Contacts(),
            builder: (context, List<Contact> value, child) {
              final contacts = value;
              return ListView.builder(
                itemCount: contacts.length,
                itemBuilder: (context, index) {
                  Contact contact = contacts[index];
                  return Dismissible(
                    key: ValueKey(contact.id),
                    onDismissed: (DismissDirection dismissDirection) {
                      contactBook.removeByContact(contact);
                    },
                    child: ListTile(
                      title: Text(contact.name),
                    ),
                  );
                },
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/new-contact'),
        child: const Icon(Icons.add),
      ),
    );
  }
}
