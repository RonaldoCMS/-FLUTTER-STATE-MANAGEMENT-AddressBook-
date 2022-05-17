import 'package:uuid/uuid.dart';

class Contact {
  late final String id;
  late final String name;
  Contact(this.name, {String? id}) {
    this.id = id ?? const Uuid().v4();
  }

  @override
  bool operator ==(covariant Contact other) => id == other.id;

  @override
  int get hashCode => id.hashCode;
}
