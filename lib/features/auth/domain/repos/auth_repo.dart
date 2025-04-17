abstract class AuthRepo {
  createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
  signInWithEmailAndPassword({required String email, required String password});
}
