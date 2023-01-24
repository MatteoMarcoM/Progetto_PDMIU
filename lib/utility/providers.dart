import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/user.dart';

// provider fornito tramite riverpod ai widget dell'app
final currentUserProvider = StateNotifierProvider<User, UserData?>(
  (ref) => User(null),
);
