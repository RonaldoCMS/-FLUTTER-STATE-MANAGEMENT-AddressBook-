import 'package:addressbook/app/bloc/bloc_bloc.dart';
import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class InfoPage extends StatefulWidget {
  final Contact contact;
  const InfoPage({required this.contact, Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController(text: widget.contact.name);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Center(
            child: TextField(
              controller: controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              String id = widget.contact.id;
              String name = controller.text;
              context.read<BlocBloc>().add(ModContactEvent(id, name));
              Navigator.of(context).pop();
            },
            child: Text("Confirm"),
          )
        ],
      ),
    );
  }
}
