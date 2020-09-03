import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:organize_flutter_project/src/business_logic/services/hive_services/hive_services.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

const BASE_URL = 'http://192.168.0.100:7000/';

class UserAuthAPIServices {
  final _client = http.Client();

  // check into api that phone number is already registered or not
  Future<ResponseObject> phoneExistsOrNot(String phone) async {
    try {
      var _response =
      await _client.post(BASE_URL + 'phoneExists', body: {'phone': phone});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        if (decodedResponse['response'] == 'success') {
          if (decodedResponse['message'] == 'This $phone exists in database') {
            return ResponseObject(
                id: ResponseCode.SUCCESSFUL, object: 'exists');
          } else {
            return ResponseObject(
                id: ResponseCode.SUCCESSFUL, object: 'not exists');
          }
        } else {
          return ResponseObject(
              id: ResponseCode.FAILED, object: decodedResponse['message']);
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

  // check into api that email is already registered or not
  Future<ResponseObject> emailExistsOrNot(String email) async {
    try {
      var _response =
      await _client.post(BASE_URL + 'checkEmailExists', body: {'email': email});
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        if (decodedResponse['error'] == false) {
          return ResponseObject(id: ResponseCode.SUCCESSFUL, object: 'not exists');
        } else {
          HiveServices.addIntegerData(name: 'id', data: decodedResponse['user'][0]['id']);
          HiveServices.addStringData(name: 'email', data: decodedResponse['user'][0]['email']);
          HiveServices.addStringData(name: 'name', data: decodedResponse['user'][0]['name']);
          HiveServices.addStringData(name: 'phone', data: decodedResponse['user'][0]['phone']);
          UserData.userId = decodedResponse['user'][0]['id'];
          UserData.email = decodedResponse['user'][0]['email'];
          UserData.name = decodedResponse['user'][0]['name'];
          UserData.phone = decodedResponse['user'][0]['phone'];
          return ResponseObject(
              id: ResponseCode.SUCCESSFUL, object: 'exists');
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


  // register new user
  Future<ResponseObject> registerUser() async{
    try {

    } catch (e){
      return ResponseObject(id: ResponseCode.FAILED, object: e.toString());
    }
  }
}