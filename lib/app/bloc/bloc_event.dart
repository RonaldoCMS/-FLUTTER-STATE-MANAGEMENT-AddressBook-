part of 'bloc_bloc.dart';

@immutable
abstract class BlocEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddContactEvent extends BlocEvent {
  Contact contact;
  AddContactEvent(this.contact);
}

class DeleteContactEvent extends BlocEvent {
  Contact contact;
  DeleteContactEvent(this.contact);
}

class ModContactEvent extends BlocEvent {
  String id;
  String name;
  ModContactEvent(this.id, this.name);
}
