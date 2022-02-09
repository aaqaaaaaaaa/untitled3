import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled3/models/user.dart';
import 'package:untitled3/services/user_provider.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<UserEvent>((event, emit) => emit(UserInitial()));
    on<UserLoadEvent>((event, emit) async {
      emit(UserLoadingState());
      try {
        final List<User> _loadedUserList =
            await userRepository.getUserProvider();
        print(_loadedUserList);
        emit(UserLoadedState(loadedUser: _loadedUserList));
      } catch (_) {
        throw Exception('Error');
        emit(UserErrorState());
      }
    });
    on<UserClearEvent>((event, emit) => emit(UserInitial()));
  }
}
