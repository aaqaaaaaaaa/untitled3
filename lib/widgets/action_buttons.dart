import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/bloc/user_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              userBloc.add(UserLoadEvent());
            },
            child: const Text('Load')),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
            onPressed: () {
              userBloc.add(UserClearEvent());
            },
            child: const Text('Clear')),
      ],
    );
  }
}
