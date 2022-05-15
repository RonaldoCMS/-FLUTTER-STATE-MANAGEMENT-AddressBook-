import 'package:addressbook/app/model/contact.dart';
import 'package:flutter/cupertino.dart';

class Contacts extends ValueNotifier<List<Contact>> {
  Contacts._shareInstance() : super([]);
  static final Contacts _share = Contacts._shareInstance();
  factory Contacts() => _share;

  int get length => value.length;

  Contact? getContact(int atIndex) =>
      (atIndex > length) ? null : value[atIndex];

  void addContact(Contact contact) {
    value.add(contact);
    notifyListeners();
  }

  void remove(int index) {
    value.removeAt(index);
    notifyListeners();
  }

  void removeByContact(Contact contact) {
    final contacts = value;
    if (contacts.contains(contact)) {
      contacts.remove(contact);
      notifyListeners();
    }
  }
}
