import 'package:addressbook/app/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactTileWideget extends InheritedModel<Contact> {
  ContactTileWideget({required Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  @override
  bool updateShouldNotifyDependent(
      covariant InheritedModel<Contact> oldWidget, Set<Contact> dependencies) {
    return true;
  }

  static ContactTileWideget of(BuildContext context) =>
      InheritedModel.inheritFrom<ContactTileWideget>(context)!;
}
