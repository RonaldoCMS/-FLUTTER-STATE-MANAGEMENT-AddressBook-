import 'dart:collection';

import 'package:addressbook/app/bloc/bloc_bloc.dart';
import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:addressbook/app/pages/info_page.dart';
import 'package:addressbook/app/widget/contact_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      body: BlocBuilder<BlocBloc, BlocState>(
        builder: (context, state) => ListView.builder(
          itemCount: state.bookContacts.contacts.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoPage(
                    contact: state.bookContacts.contacts[index],
                  ),
                ),
              ),
              child: Dismissible(
                key: ValueKey(state.bookContacts.contacts[index].id),
                onDismissed: (DismissDirection dismissDirection) {
                  context.read<BlocBloc>().add(
                      DeleteContactEvent(state.bookContacts.contacts[index]));
                },
                child: ListTile(
                  title: Text(state.bookContacts.contacts[index].name),
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
