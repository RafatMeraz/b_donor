import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:organize_flutter_project/src/business_logic/models/donor_model.dart';
import 'package:organize_flutter_project/src/business_logic/utils/api_response_object.dart';
import 'package:organize_flutter_project/src/business_logic/utils/contants.dart';

class DonorAPIServices {
  final _client = http.Client();

  // check into api that email is already registered or not
  Future<ResponseObject> getAllDonor() async {
    try {
      var _response = await _client.get(BASE_URL + 'getAllDonor');
      print(jsonDecode(_response.body));
      if (_response.statusCode == 200) {
        var decodedResponse = jsonDecode(_response.body);
        print(decodedResponse);
        return ResponseObject(
            id: ResponseCode.SUCCESSFUL, object: DonorModel.fromJson(decodedResponse));
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