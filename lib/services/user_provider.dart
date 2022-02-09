import 'package:untitled3/models/user.dart';
import 'package:untitled3/services/user_api_provide.dart';

class UserRepository{
  final UserProvider _userProvider = UserProvider();
 Future<List<User>> getUserProvider ()=> _userProvider.getJson();
}