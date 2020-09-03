class RegisterUserData {
  static String phone, name, email, bloodGroup, address, contactVisible, gender, zipCode, division, socialId, socialLogin;
}

class UserData {
  static int userId;
  static String phone, name, email;
}

class ResponseCode {
  static const int NO_INTERNET_CONNECTION = 0;
  static const int AUTHORIZATION_FAILED = 900;
  static const int SUCCESSFUL = 500;
  static const int FAILED = 501;
  static const int NOT_FOUND = 502;
}