import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:organize_flutter_project/src/business_logic/models/home_model.dart';
import 'package:organize_flutter_project/src/business_logic/models/notification_model.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class HomeAPIServices {
  final _client = http.Client();

  // check into api that email is already registered or not
  Future<ResponseObject> getHomeData() async {
    try {
      var _response = await _client.post(BASE_URL + 'getHomeData',
          body: {'user_id': UserData.userId.toString()});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        return ResponseObject(
            id: ResponseCode.SUCCESSFUL, object: HomeModel.fromJson(decodedResponse));
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            object: 'Status code for request ${_response.statusCode}');
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }

  // check into api that email is already registered or not
  Future<ResponseObject> getAllNotifications() async {
    try {
      var _response = await _client.post(BASE_URL + 'getAllMyRequest',
          body: {'user_id': UserData.userId.toString()});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        return ResponseObject(
            id: ResponseCode.SUCCESSFUL, object: NotificationModel.fromJson(decodedResponse));
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            object: 'Status code for request ${_response.statusCode}');
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }

  // change donor mode
  Future<ResponseObject> changeDonorMode(int status) async {
    try {
      var _response = await _client.post(BASE_URL + 'donorMode',
          body: {'user_id': UserData.userId.toString(), 'mode': status.toString()});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        return ResponseObject(
            id: ResponseCode.SUCCESSFUL, object: 'Donor mode changed!');
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
