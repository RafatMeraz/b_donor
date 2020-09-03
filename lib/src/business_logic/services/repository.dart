import 'package:organize_flutter_project/src/business_logic/services/api_services/home_api_services.dart';
import 'package:organize_flutter_project/src/business_logic/services/api_services/user_auth_api_services.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class _Repository {
  final UserAuthAPIServices _userAuthAPIServices = UserAuthAPIServices();
  final HomeAPIServices _homeAPIServices = HomeAPIServices();

  Future<ResponseObject> checkEmailExists(String email, EmailExistCheck emailExistCheck) async => _userAuthAPIServices.emailExistsOrNot(email, emailExistCheck);
  Future<ResponseObject> checkPhoneExists(String phone) async => _userAuthAPIServices.phoneExistsOrNot(phone);
  Future<ResponseObject> register() async => _userAuthAPIServices.register();
  Future<ResponseObject> getHomeData() async => _homeAPIServices.getHomeData();
  Future<ResponseObject> changeDonorMode(int status) async => _homeAPIServices.changeDonorMode(status);
  Future<ResponseObject> getAllNotifications() async => _homeAPIServices.getAllNotifications();
  Future<ResponseObject> responsePersonalNotifications(int requestId, int response) async => _homeAPIServices.responsePersonalNotifications(requestId, response);
  Future<ResponseObject> reactToActivity(int id) async => _homeAPIServices.reactToActivity(id);
}

final repository = _Repository();