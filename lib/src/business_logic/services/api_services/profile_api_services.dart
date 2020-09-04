import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organize_flutter_project/src/business_logic/models/profile_model.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class ProfileAPIServices {
  final _client = http.Client();

  // check into api that email is already registered or not
  Future<ResponseObject> getProfileData() async {
    try {
      final  _response = await _client.post(BASE_URL + 'profile', body: {'user_id' : UserData.userId.toString()});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        return ResponseObject(
            id: ResponseCode.SUCCESSFUL, object: ProfileModel.fromJson(decodedResponse));
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            object: 'Status code for request ${_response.statusCode}');
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }

}