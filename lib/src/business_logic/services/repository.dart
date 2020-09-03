import 'package:organize_flutter_project/src/business_logic/services/api_services/user_auth_api_services.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class _Repository {
  final UserAuthAPIServices _userAuthAPIServices = UserAuthAPIServices();

  Future<ResponseObject> checkEmailExists(String email, EmailExistCheck emailExistCheck) async => _userAuthAPIServices.emailExistsOrNot(email, emailExistCheck);
  Future<ResponseObject> register() async => _userAuthAPIServices.register();
}

final repository = _Repository();