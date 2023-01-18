import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pdmiu_app_biblioteca/models/user.dart';

class UserList extends StateNotifier<List<User>> {
  UserList(super.state);

  void addUser(User user) async {
    state = [
      ...state,
      user,
    ];
  }

  void removeUser(String userName) {
    state = state.where((user) => user.getName() != userName).toList();
  }

  // Nb specificUserProvider
  User selectUser(String userName) {
    for (final user in state) {
      if (user.getName() == userName) {
        return user;
      }
    }
    return User(UserData(username: 'mario', password: 'passwordDiMario'));
  }
}

  /*
  void setJWTValidity(String userName, bool valid) {
   
    state = [
      for (final user in state)
        if (user.state.username == userName)
          User(),
        else
          user
    ];
  }

  void setUserJWT(String userName, String jwt) {
    
    state = [
      for (final user in state)
        if (user.state.username == userName)
          User()
        else
          user
    ];
  }
}
*/