import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

// providers forniti tramite riverpod ai widget dell'app
final marioProvider = StateNotifierProvider<User, UserData>(
  (ref) => User(UserData(username: 'mario', password: 'passwordDiMario')),
);
