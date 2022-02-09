import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/bloc/user_bloc.dart';
import 'package:untitled3/services/user_provider.dart';
import 'package:untitled3/widgets/action_buttons.dart';
import 'package:untitled3/widgets/user_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final userRepository = UserRepository();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(userRepository: userRepository),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('User List'),
        ),
        body: Column(
          children: const [
            ActionButtons(),
            Expanded(child: UserList()),
          ],
        ),
      ),
    );
  }
}
