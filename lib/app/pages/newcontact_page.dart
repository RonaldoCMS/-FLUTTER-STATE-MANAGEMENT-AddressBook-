import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NewContactPage extends StatefulWidget {
  const NewContactPage({Key? key}) : super(key: key);

  @override
  State<NewContactPage> createState() => _NewContactPageState();
}

class _NewContactPageState extends State<NewContactPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Contact"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: controller),
            ElevatedButton(
              onPressed: () {
                Contact contact = Contact(controller.text);
                context.read<Contacts>().add(contact);
                Navigator.of(context).pop();
              },
              child: const Text("Confirm"),
            )
          ],
        ),
      ),
    );
  }
}
