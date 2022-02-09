import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/bloc/user_bloc.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        if (state is UserInitial) {
          return const Center(
            child: Text('No data.Press button "Load"'),
          );
        } else if (state is UserLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is UserLoadedState) {
          return ListView.builder(
            itemCount: state.loadedUser.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading:  Image.network(
                      'https://randomuser.me/api/portraits/men/$index.jpg'),
                  title: Column(
                    children: [
                      Text('${state.loadedUser[index].name}'),
                      Column(
                        children: [
                          Text('Email: ${state.loadedUser[index].email}'),
                          Text('Phone: ${state.loadedUser[index].phone}'),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          );
        } else if (state is UserErrorState) {
          return const Center(
            child: Text('Error load data'),
          );
        }
        return const Center(
          child: Text('No data'),
        );
      },
    );
  }
}
