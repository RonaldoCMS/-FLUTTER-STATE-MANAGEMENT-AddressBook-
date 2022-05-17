import 'dart:async';
import 'package:addressbook/app/model/contact.dart';
import 'package:addressbook/app/model/contacts.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<AddContactEvent>(addContact);
    on<DeleteContactEvent>(delContact);
    on<ModContactEvent>(modContact);
  }

  void delContact(DeleteContactEvent event, Emitter<BlocState> emit) {
    state.bookContacts.remove(event.contact);
    emit(BlocRefresh(state.bookContacts));
  }

  void addContact(AddContactEvent event, Emitter<BlocState> emit) {
    state.bookContacts.add(event.contact);
    emit(BlocRefresh(state.bookContacts));
  }

  void modContact(ModContactEvent event, Emitter<BlocState> emit) {
    state.bookContacts.mod(event.id, event.name);
    emit(BlocRefresh(state.bookContacts));
  }
}
