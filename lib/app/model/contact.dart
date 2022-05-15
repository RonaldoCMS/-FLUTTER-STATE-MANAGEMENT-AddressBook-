import 'package:uuid/uuid.dart';

class Contact {
  final String id;
  final String name;
  Contact(this.name) : id = const Uuid().v4();
}
