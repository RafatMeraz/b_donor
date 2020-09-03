import 'package:organize_flutter_project/src/business_logic/services/api_services/user_auth_api_services.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';

class _Repository {
  final UserAuthAPIServices _userAuthAPIServices = UserAuthAPIServices();

  Future<ResponseObject> checkEmailExists(String email) async => _userAuthAPIServices.emailExistsOrNot(email);
}

final repository = _Repository();