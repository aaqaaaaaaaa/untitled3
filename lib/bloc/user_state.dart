part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class UserLoadingState extends UserState {}

class UserLoadedState extends UserState {
  final List<User> loadedUser;

  UserLoadedState({required this.loadedUser});
}

class UserErrorState extends UserState {}
