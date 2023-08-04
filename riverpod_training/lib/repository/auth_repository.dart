// TODO An lichess anbinden wenn https://codewithandrea.com/articles/flutter-repository-pattern/
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

abstract class AuthRepository {
  Future<User> signIn();

  Future<void> signOut();
}

class User {
  const User({required this.uid});

  final String uid;
}

class FakeAuthRepo extends AuthRepository {
  @override
  Future<User> signIn() async {
    await Future.delayed(const Duration(seconds: 1));
    return const User(uid: "testUser");
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(const Duration(seconds: 1));
  }
}

@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  return FakeAuthRepo();
}
