import 'dart:async';
import 'dart:collection';

import 'package:addressbook/app/model/contact.dart';
import 'package:flutter/cupertino.dart';

class Contacts {
  final List<Contact> contacts = [Contact("Peppe")];

  void add(Contact contact) {
    contacts.add(contact);
    contacts.sort((v1, v2) {
      return v1.name.length.compareTo(v2.name.length);
    });
  }

  void remove(Contact contact) {
    contacts.remove(contact);
  }

  void mod(String id, String name) {
    contacts.firstWhere((element) => id == element.id).name = name;
  }
}
