/// This houses all the abstract calls made to the backend
abstract class Api {
  //GET EMAIL TOKEN
  Future<dynamic> getEmailToken({required String email});

  //VERIFY EMAIL TOKEN
  Future<dynamic> verifyEmailToken({
    required String email,
    required String token,
  });

  //REGISTER USER
  Future<dynamic> registerUser({
    required String email,
    required String username,
    required String fullname,
    required String country,
    required String password,
    required String device_name,
  });

  //LOGIN USER
  Future<dynamic> loginUser({
    required String email,
    required String password,
    required String device_name,
  });

  //LOGOUT USER
  Future<dynamic> logoutUser();

  //SECRET HOME MESSAGE
  Future<dynamic> dashboard({required String token});
}
