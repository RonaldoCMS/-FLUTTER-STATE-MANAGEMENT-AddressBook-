part of 'bloc_bloc.dart';

@immutable
abstract class BlocState {
  final Contacts bookContacts;
  BlocState(this.bookContacts);
}

class BlocInitial extends BlocState {
  BlocInitial() : super(Contacts());
}

class BlocRefresh extends BlocState {
  BlocRefresh(Contacts bookContacts) : super(bookContacts);
}
