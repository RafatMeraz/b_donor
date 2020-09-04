import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organize_flutter_project/src/business_logic/models/request_model.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class RequestAPIServices {
  final _client = http.Client();

  // check into api that email is already registered or not
  Future<ResponseObject> getAllRequest() async {
    try {
      var _response = await _client.get(BASE_URL + 'getAllRequest');
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        final decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        if (decodedResponse['error'] == false){
          return ResponseObject(
              id: ResponseCode.SUCCESSFUL, object: RequestModel.fromJson(decodedResponse));
        } else {
          return ResponseObject(
              id: ResponseCode.FAILED, object: 'Get all requests failed! Try again.');
        }
      } else {
        return ResponseObject(
            id: ResponseCode.FAILED,
            object: 'Status code for request ${_response.statusCode}');
      }
    } catch (e) {
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }

  // create a new request api
  Future<ResponseObject> createNewRequest(String address, String bloodFor, String bloodType, int units, String bloodGroup, String contact, String division) async {
    try {
      var _response = await _client.post(BASE_URL + 'createNewRequest', body: {
        'user_id' : UserData.userId.toString(),
        'address' : address,
        'blood_for' : bloodFor,
        'blood_type' : bloodType,
        'units' : units.toString(),
        'blood_group' : bloodGroup,
        'contact' : contact,
        'division' : division,
      });
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        final decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        if (decodedResponse['error'] == false){
          return ResponseObject(
              id: ResponseCode.SUCCESSFUL, object: 'Request added!');
        } else {
          return ResponseObject(
              id: ResponseCode.FAILED, object: 'Request add failed! Try again.');
        }
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